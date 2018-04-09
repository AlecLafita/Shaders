#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform sampler2D sampler;


in vec4 vert;
in vec2 vtexCoord;


void main() {
    vec3 fx = dFdx(vert.xyz);
    vec3 fy = dFdy(vert.xyz);
    vec3 N = cross(fx,fy);
    N = normalize(N);
    fragColor = texture(sampler,vec2(N.x,N.y));
}
