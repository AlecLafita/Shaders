#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const float speed = 10.5;
uniform float time;
in vec3 V[];
in vec3 N[];
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	vec3 n = (N[0]+ N[1] + N[2])/3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*vec4(V[i] + speed*time*n,1);
		EmitVertex();
	}
    EndPrimitive();
}
