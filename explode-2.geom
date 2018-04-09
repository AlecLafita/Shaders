#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const float speed = 0.5;
const float angSpeed = 8.0;
uniform float time;
in vec3 V[];
in vec3 N[];
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	vec3 n = (N[0]+ N[1] + N[2])/3;
	vec3 bar = (V[0] +V[1]+V[2])/3;
	
	float fi = angSpeed*time;
	mat3 rot = mat3(vec3(cos(fi),sin(fi),0),vec3(-sin(fi),cos(fi),0),vec3(0,0,1));
	
	vec3 tr = speed*time*n;
	mat4 trans = mat4(vec4(1,0,0,0),vec4(0,1,0,0),vec4(0,0,1,0),vec4(tr.x,tr.y,tr.z,1));
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*trans*vec4(rot*(V[i]-bar),1);
		EmitVertex();
	}
    EndPrimitive();
}
