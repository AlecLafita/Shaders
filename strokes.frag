#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform float matShininess;
uniform vec4 lightPosition;

in vec3 norm;
in vec4 pos;

uniform sampler2D strokes;


float lim(vec3 N, vec3 V, vec3 L){

	N=normalize(N);
	V=normalize(V);
	L=normalize(L);
	vec3 R = normalize(2.0*dot(N,L)*N-L);
	float NdotL = max( 0.0, dot( N,L ) );
	float RdotV = max( 0.0, dot(R,V ) );
	float Ispec = 0;
	if (NdotL>0) Ispec=pow( RdotV, matShininess );
	return NdotL + Ispec;
}


void main()
{

    vec3 P = pos.xyz;
    vec3 V = -P;
    vec3 L = (lightPosition.xyz - P);

    float f = lim(norm,V,L);	

    if (f < 0.4) fragColor = vec4(0.0,0.0,0.0,1.0);
    else fragColor = mix(texture(strokes,vec2(1.0/512.0)*gl_FragCoord.xy),vec4(1.0,1.0,1.0,1.0),pow(f,16)); 
}
