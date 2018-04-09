#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3  boundingBoxMin;
in vec3 V[];
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*vec4(V[i],1.0);
		EmitVertex();
	}
    EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0.0,0.0,0.0,1.0);
		gl_Position = modelViewProjectionMatrix*vec4(V[i].x,boundingBoxMin.y,V[i].z,1.0);
		EmitVertex();
	}
    EndPrimitive();
}
