#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform bool eyespace;
uniform float time;
const float pi = 3.141592;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax; 

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    float amplitude;
    if(eyespace) {
      amplitude = distance(boundingBoxMin,boundingBoxMax) ;
      amplitude = (amplitude/20)*vertex.y;
    }
    else amplitude = vertex.y;
    float dist = amplitude*sin(time);
    gl_Position = modelViewProjectionMatrix * vec4(vertex + dist*normal,1.0);
}
