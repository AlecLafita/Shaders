#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D myMap;
uniform float time;
in vec2 vtexCoord;



void main()
{
	float frame = mod(floor(time*30),48);
	float x = 1.0/8.0;
	float y = 1.0/6.0;
    	vec4 color = texture(myMap, vec2(vtexCoord.s*x + (x*mod(frame,8.0)), vtexCoord.t*y + (5 -floor(frame/8.0))*y)); 

	fragColor = color*color.a;
}
