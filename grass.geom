#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 N[];
out vec3 normal;
out vec4 gPos;
uniform mat4 modelViewProjectionMatrix;
uniform float d = 0.1;
uniform mat3 normalMatrix;

void main( void )
{
	normal = (normalize((N[0] + N[1] + N[2])/3));
	vec4 v0 = gl_in[0].gl_Position + vec4(normal,0)*d;
	vec4 v1 = gl_in[1].gl_Position + vec4(normal,0)*d;
	vec4 v2 = gl_in[2].gl_Position + vec4(normal,0)*d;
	

	for( int i = 0 ; i < 3 ; i++ )
	{
		gPos = gl_in[i].gl_Position;
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
	EndPrimitive();

	
	normal =  (normalize(cross((v2- gl_in[2].gl_Position).xyz,(gl_in[1].gl_Position- gl_in[2].gl_Position).xyz)));
	gPos = gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
	EmitVertex();
	gPos = gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	gPos = v1;
	gl_Position = modelViewProjectionMatrix*v1;
	EmitVertex();
	gPos = v2;
	gl_Position = modelViewProjectionMatrix*v2;
	EmitVertex();
	EndPrimitive();

	normal =  (normalize(cross((gl_in[0].gl_Position- gl_in[2].gl_Position).xyz,(v2- gl_in[2].gl_Position).xyz)));
	gPos = v2;
	gl_Position = modelViewProjectionMatrix*v2;
	EmitVertex();
	gPos = v0;
	gl_Position = modelViewProjectionMatrix*v0;
	EmitVertex();
	gPos = gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*(gl_in[2].gl_Position);
	EmitVertex();
	gPos = gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*(gl_in[0].gl_Position);
	EmitVertex();
	EndPrimitive();

	normal =  (normalize(cross((v1- gl_in[1].gl_Position).xyz,(gl_in[0].gl_Position- gl_in[1].gl_Position).xyz)));
	gPos = gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*(gl_in[0].gl_Position);
	EmitVertex();
	gPos = gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*(gl_in[1].gl_Position);
	EmitVertex();
	gPos = v0;
	gl_Position = modelViewProjectionMatrix*v0;
	EmitVertex();
	gPos = v1;
	gl_Position = modelViewProjectionMatrix*v1;
	EmitVertex();
	EndPrimitive();

}
