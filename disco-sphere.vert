#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix,modelViewMatrix;
uniform mat3 normalMatrix;
uniform float time;
out vec4 vert;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    float angle = 0.1*time;
    mat3 rot = mat3(vec3(cos(angle),sin(angle),0),vec3(-sin(angle),cos(angle),0),vec3(0,0,1));
    
    vec3 V = rot*vertex;
    vec4 vert = modelViewMatrix*vec4(V.xyz,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(V.xyz, 1.0);
}
