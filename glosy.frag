#version 330 core

uniform sampler2D glossy;
uniform int r = 40;

in vec4 frontColor;
out vec4 fragColor;

in vec3 P;
in vec3 N;

vec4 sampleTexture(sampler2D sampler, vec2 st, int r) {
	vec4 acum = vec4(0.0,0.0,0.0,0.0);
	for (int i = -r; i <= r;++i) {
		for(int j = -r; j <= r;++j) {
			acum += texture(sampler,vec2(st.s+i/512,st.t + j/512));
		}
	}
	return acum/((2*r +1 )*(2*r +1 ));
}

vec4 sampleSphereMap(sampler2D sampler, vec3 R) {
	float z = sqrt((R.z+1.0)/2.0);
	vec2 st = vec2((R.x/(2.0*z)+1.0)/2.0, (R.y/(2.0*z)+1.0)/2.0);
    st.y = -st.y;
	return sampleTexture(sampler, st, r);
}

void main() {
	vec3 obs = vec3(0.0);
	vec3 I = normalize(P-obs);
	vec3 R = reflect(I, N);
	
	fragColor = sampleSphereMap(glossy, R);
}
