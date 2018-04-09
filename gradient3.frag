#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 N;

void main()
{
	float normal = normalize(N).z;
	
	
    float prop = 4 - normal*4;
    vec3 colors[5]= vec3[5](vec3(1,0,0),vec3(1,1,0),vec3(0,1,0),vec3(0,1,1),vec3(0,0,1));
    int pos = int(floor(prop));
    vec3 col = mix(colors[pos],colors[pos+1],fract(prop));
	
    fragColor = vec4(col,1.0);
}
