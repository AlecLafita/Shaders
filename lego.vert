#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;


uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

out vec3 V;
out vec3 N;
out vec4 vfrontColor;


void main()
{
    vfrontColor = vec4(color,1);
    V = vertex;
    N = normalize(normalMatrix*normal);
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
