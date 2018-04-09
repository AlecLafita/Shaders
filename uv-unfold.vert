#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec2 Min=vec2(-1,-1);
uniform vec2 Max=vec2(1,1);
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) ;

    float distx = (Max[0] -Min[0]);
    float disty = (Max[1] -Min[1]);
    
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(Min[0] + texCoord.s*distx ,Min[1] + texCoord.t*disty, 0, 1.0);
}
