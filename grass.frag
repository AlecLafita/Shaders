#version 330 core

out vec4 fragColor;
in vec3 normal;

uniform sampler2D grass_top0,grass_side1;
in vec4 gPos;
uniform float d;

void main()
{

    if (normal.z ==0) { //vertical
	vec4 color = texture(grass_side1, vec2(4*(gPos.x - gPos.y),1+ gPos.z/d));
	if (color.a < 0.1) discard;
	else fragColor = color;
    }

    else { //horitzontal
	fragColor = texture(grass_top0, 4*vec2(gPos.x,1- gPos.y));
    }

}
