#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 norm;

in vec2 vtexCoord;
uniform sampler2D interior0;
uniform sampler2D window1;
 
void main()
{
	vec3 N = (norm);
	vec4 c = texture(window1,vtexCoord);
	if(c.a ==1.0) fragColor = c;
	else {
		vec4 c2 =  texture(interior0,vtexCoord + vec2(0.5*N.x, -0.5*N.y));
		fragColor = mix(c,c2,abs(N.z));
	}
}
