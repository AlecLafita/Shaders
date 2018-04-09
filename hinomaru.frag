#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
   //float x = 1- step(0.2,distance(vec2(0.5,0.5),vtexCoord));	

   //float x = 1- smoothstep(0.2 -0.0005, 0.2 + 0.0005,distance(vec2(0.5,0.5),vtexCoord));

	float width = 0.7*length(vec2(dFdx(vtexCoord.s), dFdy(vtexCoord.s)));

	float x = 1- smoothstep(0.2-width, 0.2+width, distance(vec2(0.5,0.5),vtexCoord));	
    fragColor = vec4(1.0,1.0,1.0,1.0) - x*vec4(0.0,1.0,1.0,0.0);
}
