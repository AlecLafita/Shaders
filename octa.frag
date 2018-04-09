#version 330 core

in vec4 gfrontColor;
in vec3 normal;
out vec4 fragColor;

void main()
{
    fragColor = gfrontColor*(normalize(normal).z);
}
