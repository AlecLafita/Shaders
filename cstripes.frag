#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int nstripes = 16;
uniform vec2 origin=vec2(0,0);


void main()
{

    float x = step(1,mod(nstripes*distance(origin,vtexCoord),2)); 
    fragColor = vec4(1.0,0.0,0.0,1.0) + x*vec4(0.0,1.0,0.0,1.0);
}
