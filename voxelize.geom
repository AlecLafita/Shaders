#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;

in vec3 V[];

uniform float step = 0.2;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main( void )
{
	float dis = step/2;

	vec3 bar = (V[0]+V[1]+V[2])/3;//Baricentro del triangulo
	bar = round(bar/step)*step ;//centro cubo



	gfrontColor = vec4(0.5,0.5,0.5,1);
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,-dis),1.0);
	EmitVertex();	
	EndPrimitive();
	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
	
	
	gfrontColor = vec4(0.3,0.3,0.3,1);
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
	
	gfrontColor = vec4(0.6,0.6,0.6,1);
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,-dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,-dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,-dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,dis),1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
}
