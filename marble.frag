#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec4 posobj;
in vec3 N;

uniform sampler2D noise;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
const vec4 plas = 0.3*vec4(0.0, 1.0, -1.0, 0.0);
const vec4 plat = 0.3*vec4(-2.0, -1.0, 1.0, 0.0);


vec4 shading(vec3 N, vec3 V, vec4 diffuse) {
    const vec3 lightPos = vec3(0.0,0.0,2.0);
    vec3 L = normalize( lightPos - V );
    vec3 R = reflect(-L,N);
    float NdotL = max( 0.0, dot( N,L ) );
    float RdotV = max( 0.0, dot( R,V ) );
    float Ispec = pow( RdotV, 20.0 );
    return diffuse * NdotL + Ispec;
}



void main()
{
    vec3 V = (modelViewMatrix*posobj).xyz;
    V = normalize(V);
    vec3 normal = normalize(normalMatrix*N);
    float coords = dot(plas,posobj);
    float coordt = dot(plat,posobj);
    float v = (texture(noise,vec2(coords,coordt))).r;
    vec4 diffuse;
    if(v <0.5) 
      diffuse = mix(vec4(1.0,1.0,1.0,1.0),vec4(0.5,0.2,0.2,1.0),v*2);
    else 
      diffuse = mix(vec4(0.5,0.2,0.2,1.0),vec4(1.0,1.0,1.0,1.0),(v-0.5)*2); 
    
    fragColor = shading(normal,-V,diffuse);
}
