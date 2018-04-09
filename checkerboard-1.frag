#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    vec2 t = vec2(floor(vtexCoord*8)); //vec2(vtexCoord*8)
float x = mod(t.x,2);			//step(1,mod(t.x,2));
    float y = mod(t.y,2);

    fragColor = int(x==y)*vec4(0.8,0.8,0.8,1.0);

}

