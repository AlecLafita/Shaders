#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(1.0,1.0,1.0,1.0) * N.z;
    vec3 V = vertex;
    V.y -= 0.94;
    float fi = 0.18*sin(time);
    if (V.x < 0) fi *=-1;
    mat3 rot = mat3(vec3(cos(fi), sin(fi), 0), vec3(-sin(fi),cos(fi),0), vec3(0,0,1));
    vec3 aux;
    if(V.y <=0) {
	aux = rot*V;
	V = mix(V,aux, clamp(-3.0*V.y,0.0,1.0));
    }
    V.y += 0.94;
    gl_Position = modelViewProjectionMatrix * vec4(V.xyz, 1.0);
}
