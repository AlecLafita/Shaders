#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform bool classic = false;
const float pi = 3.141592;


void main()
{
  float omega = pi/16;
  
  //float x = 1- step(0.2,distance(vec2(0.5,0.5),vtexCoord));	
  //float x = 1- smoothstep(0.2 -0.0005, 0.2 + 0.0005,distance(vec2(0.5,0.5),vtexCoord));
  float width = 0.7*length(vec2(dFdx(vtexCoord.s), dFdy(vtexCoord.t)));
  float x = 1- smoothstep(0.2-width, 0.2+width, distance(vec2(0.5,0.5),vtexCoord));	
	
  if(!classic && x < 0.5) {
    vec2 u = vec2(vtexCoord.s - 0.5, vtexCoord.t -0.5);
    float fi = atan(u.t,u.s);
    x = 1- smoothstep(1-width, 1 + width, mod(fi/omega +0.5, 2));
  }
    
    fragColor = vec4(1.0,1.0,1.0,1.0) - x*vec4(0.0,1.0,1.0,0.0);  //Si x=1 ,vermell

}
