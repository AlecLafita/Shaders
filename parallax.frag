#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D map;
uniform float time;
uniform float a = 0.30;
const float pi = 3.141592;
in vec2 vtexCoord;



void main()
{
  float fi = 2*pi*time;
  
  vec4 color = texture(map,vtexCoord);
  float m = max(max(color.r,color.g),color.b);
  vec2 u = vec2(m,m);
  mat2 rot = mat2(vec2(cos(fi),sin(fi)), vec2(-sin(fi),cos(fi)));
  u = rot*u;
   fragColor = texture(map,vtexCoord + (a/100.0)*u);
}
