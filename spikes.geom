#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 N[];
out vec4 gfrontColor;

uniform float disp = 0.05;
uniform mat4 projectionMatrix;

void main( void )
{
	vec3 normal = (N[0]+N[1]+N[2])/3;
	vec4 bar = (gl_in[0].gl_Position + gl_in[1].gl_Position +gl_in[2].gl_Position)/3;
	bar = bar + vec4(normal,1.0)*disp;

	normal = abs(normalize(cross((bar-gl_in[0].gl_Position).xyz, (gl_in[1].gl_Position -gl_in[0].gl_Position).xyz)));
	for( int i = 0 ; i < 2 ; i++ )
	{
		gfrontColor = vfrontColor[i]*normal.z;
		gl_Position = projectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
	gfrontColor = vec4(1.0,1.0,1.0,1.0);
	gl_Position = projectionMatrix*bar;
	EmitVertex();
	EndPrimitive();

	normal = abs(normalize(cross((bar-gl_in[1].gl_Position).xyz, (gl_in[2].gl_Position -gl_in[1].gl_Position).xyz)));
	gfrontColor = vfrontColor[1]*normal.z;
	gl_Position = projectionMatrix*gl_in[1].gl_Position;
	EmitVertex();
	gfrontColor = vec4(1.0,1.0,1.0,1.0);
	gl_Position = projectionMatrix*bar;
	EmitVertex();
	gfrontColor = vfrontColor[2]*normal.z;
	gl_Position = projectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	EndPrimitive();

	normal = abs(normalize(cross((bar-gl_in[2].gl_Position).xyz, (gl_in[0].gl_Position -gl_in[2].gl_Position).xyz)));
	gfrontColor = vec4(1.0,1.0,1.0,1.0);
	gl_Position = projectionMatrix*bar;
	EmitVertex();
	gfrontColor = vfrontColor[2]*normal.z;
	gl_Position = projectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	gfrontColor = vfrontColor[0]*normal.z;
	gl_Position = projectionMatrix*gl_in[0].gl_Position;
	EmitVertex();
    	EndPrimitive();
}
