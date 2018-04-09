#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main( void )
{
      float n = floor(100*time);
      
      if (gl_PrimitiveIDIn <= n ) {
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
	EndPrimitive();
      }
    
}