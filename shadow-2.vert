#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vfrontColor = vec4(color,1.0);
    gl_Position = vec4(vertex.xyz, 1.0);
}
