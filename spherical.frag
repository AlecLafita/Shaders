#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
uniform sampler2D map0;
in vec2 gtexCord;

void main()
{

    fragColor = texture(map0,gtexCord);	
    if(fragColor.a != 1) discard;	 
}
