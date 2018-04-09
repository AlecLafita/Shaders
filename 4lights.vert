varying vec3 N;   
varying vec3 P; 

void main( void )
{
	gl_Position = gl_ModelViewProjectionMatrix*gl_Vertex;
	N = gl_Normal;
	P = gl_Vertex.xyz;
}


