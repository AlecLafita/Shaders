#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec2 gtexCord;
uniform float side = 0.7;
uniform mat4 projectionMatrixInverse;
uniform mat4 projectionMatrix;


void main( void ) {

	vec4 centre = projectionMatrixInverse*gl_in[0].gl_Position;

	gl_Position = projectionMatrix*(centre + vec4(-side/2,-side/2,0,0));
	gtexCord = vec2(0,0);
	EmitVertex();

	gl_Position = projectionMatrix*(centre + vec4(-side/2,side/2,0,0));
	gtexCord = vec2(0,1);
	EmitVertex();

	gl_Position = projectionMatrix*(centre + vec4(side/2,-side/2,0,0));
	gtexCord = vec2(1,0);
	EmitVertex();

	gl_Position = projectionMatrix*(centre + vec4(side/2,side/2,0,0));
	gtexCord = vec2(1,1);
	EmitVertex();
	
	EndPrimitive();
}
