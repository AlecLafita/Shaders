#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform vec3 origin = vec3(1,0,0);
uniform vec3 axis = vec3(0,1,0);
uniform float slice = 0.1;

in vec3 posobj;


void main()
{


    float d1 = determinant(mat2(vec2(posobj.y-origin.y,axis.y),vec2(posobj.z-origin.z,axis.z)));
    d1 = d1*d1;
    float d2 = determinant(mat2(vec2(posobj.z-origin.z,axis.z),vec2(posobj.x-origin.x,axis.x)));
    d2 = d2*d2;
    float d3 = determinant(mat2(vec2(posobj.x-origin.x,axis.x),vec2(posobj.y-origin.y,axis.y)));
    d3 = d3*d3;
    float d = sqrt((d1+d2+d3)/(axis.x*axis.x + axis.y*axis.y + axis.z*axis.z));

    float x = 1 - step(1,mod(d/slice,2));
    fragColor = vec4(0.0,0.0,1.0,1.0) + x*vec4(0.0,1.0,0.0,1.0);
}
