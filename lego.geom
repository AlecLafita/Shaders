#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;
out vec2 gtexCoord;

in vec3 V[];
in vec3 N[];
in vec4 vfrontColor[];

uniform float Step = 0.02;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main( void )
{
	float dis = Step/2;

	vec3 bar = (V[0]+V[1]+V[2])/3;//Baricentro del triangulo
	vec3 normal = normalize((N[0]+N[1]+N[2])/3);
	bar = round(bar/Step)*Step ;//centro cubo
	vec4 auxC = (vfrontColor[0] + vfrontColor[1] + vfrontColor[2])/3;

	gfrontColor = vec4(1.0,0.0,0.0,1.0);
	if (distance(auxC,gfrontColor) > distance(auxC,vec4(0.0,1.0,0.0,1.0))) 
		gfrontColor = vec4(0.0,1.0,0.0,1.0);	
	if (distance(auxC,gfrontColor) > distance(auxC,vec4(0.0,0.0,1.0,1.0))) 
		gfrontColor = vec4(0.0,0.0,1.0,1.0);
	if (distance(auxC,gfrontColor) > distance(auxC,vec4(0.0,0.0,1.0,1.0))) 
		gfrontColor = vec4(0.0,0.0,1.0,1.0);
	if (distance(auxC,gfrontColor) > distance(auxC,vec4(0.0,1.0,1.0,1.0))) 
		gfrontColor = vec4(0.0,1.0,1.0,1.0);
	if (distance(auxC,gfrontColor) > distance(auxC,vec4(1.0,1.0,0.0,1.0))) 
		gfrontColor = vec4(1.0,1.0,0.0,1.0);

	gtexCoord = vec2(0,0);
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
	gtexCoord = vec2(1,0);	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,-dis),1.0);
	EmitVertex();
	gtexCoord = vec2(0,1);	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(-dis,dis,dis),1.0);
	EmitVertex();
	gtexCoord = vec2(1,1);	
	gl_Position = modelViewProjectionMatrix*vec4(bar + vec3(dis,dis,dis),1.0);
	EmitVertex();	
	EndPrimitive();
}
