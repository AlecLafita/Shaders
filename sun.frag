#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 12;
in vec2 vtexCoord;
const float pi = 3.141592;


bool pointInsideTriangle(vec2 p, vec2 p0, vec2 p1, vec2 p2){
	float a = (-p1.y*p2.x + p0.y*(-p1.x + p2.x) + p0.x*(p1.y - p2.y) + p1.x*p2.y);
	float s = 1./a*(p0.y*p2.x - p0.x*p2.y + (p2.y - p0.y)*p.x + (p0.x - p2.x)*p.y);
	float t = 1./a*(p0.x*p1.y - p0.y*p1.x + (p0.y - p1.y)*p.x + (p1.x - p0.x)*p.y);
	return (s>0) && (t>0) && (1-s-t>0);
}


void main()
{
    vec2 st = fract(vtexCoord);

    //si x = 1, vermell, si x = 0, groc
    float x = step(0.2,distance(vec2(0.5,0.5),st));
 
    if ( x ==1 ) { //no es el centre
  	 int i = 0;
	 float beta = pi/n;
	 while ( i <n && x==1) {
		 float alpha = (2*pi*i)/n;
		 vec2 p0 = vec2(0.5, 0.5) + 0.45*vec2(cos(alpha), sin(alpha));
		 vec2 p1 = vec2(0.5, 0.5) + 0.2*vec2(cos(alpha+beta), sin(alpha+beta));
		 vec2 p2 = vec2(0.5, 0.5) + 0.2*vec2(cos(alpha-beta), sin(alpha-beta));
		 if ( pointInsideTriangle(st,p0,p1,p2)) x = 0;
		 ++i;
	}

    }

    fragColor = vec4(1.0,1.0,0.0,1.0) - x*vec4(0.0,1.0,0.0,1.0);
}
