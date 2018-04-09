#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;

uniform sampler2D map0;
in vec2 gtexCoord;


void main()
{
   fragColor = texture(map0,gtexCoord)*gfrontColor;

}
