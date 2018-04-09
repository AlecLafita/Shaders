#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 N;
in vec4 posVec;
uniform float epsilon = 0.1;
uniform float light = 0.5;
uniform vec4 lightPosition;


void main()
{
    vec3 L = normalize(-posVec.xyz);
    vec3 normal = normalize(N);
    float pr = dot(L,normal);
    
    if ( pr < epsilon) fragColor = vec4(0.7,0.6,0.0,1);
    else fragColor = frontColor *light* normal.z;
}
