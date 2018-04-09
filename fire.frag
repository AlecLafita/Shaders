#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;

uniform float time;
in vec2 vtexCoord;
uniform float slice = 0.1;


void main()
{

	int frame = int(mod(floor(time/slice),4));
		

	switch(frame) {
		case 0:
			fragColor = texture(sampler0,vtexCoord);
			break;	
		case 1:
			fragColor = texture(sampler1,vtexCoord);
			break;			
		case 2:
			fragColor = texture(sampler2,vtexCoord);
			break;	
		case 3:
			fragColor = texture(sampler3,vtexCoord);
			break;

	}


}


