#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform sampler2D sampler;


uniform int textureSize = 1024;
uniform int edgeSize = 2;
uniform float threshold = 0.2;
in vec2 vtexCoord;

void main()
{

	vec2 left = vtexCoord + edgeSize * vec2(-1, 0) / textureSize;
	vec2 right = vtexCoord + edgeSize * vec2(1, 0) / textureSize;
	vec2 bottom = vtexCoord + edgeSize * vec2(0, -1) / textureSize;
	vec2 top = vtexCoord + edgeSize * vec2(0, 1) / textureSize;
	
	float GX = distance(texture(sampler,right),texture(sampler,left));
	float GY = distance(texture(sampler,top),texture(sampler,bottom));

	if (length(vec2(GX,GY)) > threshold) fragColor = vec4(0.0,0.0,0.0,1.0);
	else fragColor = texture(sampler,vtexCoord);
}
