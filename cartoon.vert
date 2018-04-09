#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix,modelViewMatrix;
uniform mat3 normalMatrix;

out vec3 norm;
out vec4 pos;

void main()
{
    norm = normalize(normalMatrix * normal);
    pos = modelViewMatrix*vec4(vertex.xyz,1.0);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
