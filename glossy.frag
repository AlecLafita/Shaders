uniform sampler2D glossy;
uniform int r;

varying vec3 P;
varying vec3 N;

vec4 sampleTexture(sampler2D sampler, vec2 st, int r)
{
	return texture2D(sampler, st);
}

vec4 sampleSphereMap(sampler2D sampler, vec3 R)
{
	float z = sqrt((R.z+1.0)/2.0);
	vec2 st = vec2((R.x/(2.0*z)+1.0)/2.0, (R.y/(2.0*z)+1.0)/2.0);
    st.y = -st.y;
	return sampleTexture(sampler, st, r);
}

void main()
{
	vec3 obs = vec3(0.0);
	vec3 I = normalize(P-obs);
	vec3 R = reflect(I, N);
	
	gl_FragColor = sampleSphereMap(glossy, R);
}
