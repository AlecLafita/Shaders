#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
uniform float speed = 1.0;
uniform float time;


void main( void )
{
	float aux = time*speed;

	if (floor(mod(aux,2)) ==  mod(gl_PrimitiveIDIn,2) ) {
		for( int i = 0 ; i < 3 ; i++ )
		{
			gfrontColor = vfrontColor[i];
			gl_Position = gl_in[i].gl_Position;
			EmitVertex();
		}
	    	EndPrimitive();
	}

	else {
		vec4 bar = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3;
		for( int i = 0 ; i < 3 ; i++ )
		{
			gfrontColor = vfrontColor[i];
			gl_Position = mix(gl_in[i].gl_Position,bar,(sin(fract(aux)*3.141592)) );
			EmitVertex();
		}
	    	EndPrimitive();

	}
	
}
