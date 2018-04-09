#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 8;

void main()
{
    if (mod(gl_FragCoord.y -0.5,n) != 0 ) discard;
    else fragColor = frontColor;
}
