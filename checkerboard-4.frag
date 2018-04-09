#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n = 8;
void main()
{
    vec2 aux = vec2(vtexCoord*n);
    float x = fract(aux.x);
    float y = fract(aux.y);
    if (x<0.1 || y < 0.1) fragColor = vec4(1.0,0.0,0.0,1.0);
    else discard;

}

