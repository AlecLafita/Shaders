#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3  boundingBoxMin,boundingBoxMax;
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0.0,0.0,0.0,1.0);
		gl_Position = modelViewProjectionMatrix*vec4(gl_in[i].gl_Position.x,boundingBoxMin.y,gl_in[i].gl_Position.z,1.0);
		EmitVertex();
	}
    EndPrimitive();

   if ( gl_PrimitiveIDIn == 0) {
	float R = length(boundingBoxMax- boundingBoxMin)/2;
	vec3 C = (boundingBoxMin + boundingBoxMax)/2;
	C.y = boundingBoxMin.y - 0.01;
	gfrontColor = vec4(0.0,1.0,1.0,1.0);

	gl_Position = modelViewProjectionMatrix*vec4(C + vec3(-R,0,-R),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(C + vec3(-R,0,R),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(C + vec3(R,0,-R),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(C + vec3(R,0,R),1.0);
	EmitVertex();

	EndPrimitive();
   }
}
