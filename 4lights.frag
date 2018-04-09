varying vec3 N;   	// normal (en object space)
varying vec3 P; 	// posicio del vertex (en object space)
uniform float time;
uniform bool rotate;

// V, N, P, lightPos han d'estar al mateix espai de coordenades
// V és el vector unitari cap a l'observador
// N és la normal
// P és la posició 
// lightPos és la posició de la llum
// lightColor és el color de la llum
vec4 light(vec3 V, vec3 N, vec3 P, vec3 lightPos, vec3 lightColor)
{
	const float shininess = 100.0;
	const float Kd = 0.5;
	N = normalize(N);
	vec3 L = normalize(lightPos - P);
	vec3 R = reflect(-L, N);
	float NdotL = max(0.0, dot(N,L));
	float RdotV = max(0.0, dot(R,V));
	float spec =  pow( RdotV, shininess);
	return vec4(Kd*lightColor*NdotL + vec3(spec),0);
}

void main()
{
	vec3 V = normalize(gl_ModelViewMatrixInverse[3].xyz - P);
	vec4 c = light(V, N, P, vec3(0, 0, 0), vec3(1, 1, 1));
	gl_FragColor = c;
}
