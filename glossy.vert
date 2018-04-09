varying vec3 P;
varying vec3 N;


void main()
{
	N = gl_NormalMatrix * gl_Normal;
	P = (gl_ModelViewMatrix * gl_Vertex).xyz;
	gl_Position    = gl_ModelViewProjectionMatrix *gl_Vertex;
}
