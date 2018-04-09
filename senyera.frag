#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    float a = 9;

    vec2 t = vec2(vtexCoord*a);
    float x = step(1,mod(mod(t.x,9),2));
    fragColor = vec4(1.0,1.0,0.0,1.0) - x*vec4(0.0,1.0,0.0,1.0);

}

