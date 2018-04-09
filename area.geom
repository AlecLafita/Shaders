#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;

uniform mat4 projectionMatrix;
const float areamax = 0.0005;


void main( void )
{
	vec3 u = (gl_in[1].gl_Position - gl_in[0].gl_Position).xyz;
	vec3 v = (gl_in[2].gl_Position - gl_in[0].gl_Position).xyz;
	float area = length(cross(u,v))/2;
	area /= areamax;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = mix(vec4(1.0,0.0,0.0,1.0),vec4(1.0,1.0,0.0,1.0),area);
		gl_Position = projectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}
