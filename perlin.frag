#version 330 core

out vec4 fragColor;
in vec2 vtexCoord;

//Numero de octavas, que representan una función de ruido. La función 
//final de Perlin es la suma de todas ellas.
uniform float octava = 8;

//Frecuencia de la amplitud, es decir, por que numero se multiplica la  
//amplitud de una octava para obtener la amplitud de la siguiente octava
uniform float persistencia = 0.3;

float noise(int x, int y) { //Generar un número pseudoaleatorio ente 0 y 1
    int n = x + y*57;
    n = (n<<13) ^ n;
    return ((1.0 - abs(n*(n*n*15731+789221)+1376312589) / 1073741824.0)+1)/2.0;
}

float smoothNoise(int x, int y){
    float diagonales = (noise(x-1, y-1)+noise(x+1, y-1)+noise(x-1, y+1)+noise(x+1,y+1)) / 16;
    float lados = (noise(x-1, y)+noise(x+1, y)+noise(x, y-1)+noise(x,y+1)) /  8;
    float centro =  noise(x, y) / 4;
    return diagonales + lados + centro;
}

float interpolatedNoise(float x, float y) {
      float v1 = smoothNoise(int(x), int(y));
      float v2 = smoothNoise(int(x)+1, int(y));
      float i1 = mix(v1 , v2 , fract(x));
      v1 = smoothNoise(int(x),int(y) + 1);
      v2 = smoothNoise(int(x)+1, int(y) + 1);
      float i2 = mix(v1 , v2 , fract(x));
      return mix(i1 , i2 , fract(y));
}


float perlinNoise2D(float x, float y){ //Devuelve un valor entre 0 y 1
      float perlin = 0;
      float n = octava - 1;
      float freq,ampl,totalAmpl;
      totalAmpl = 0;	 
      ampl = 0.5;
      float dos = 2.0;//con 2.0 directamente la funcion pow da problemas
      for(int i = 0; i < n;++i){
          freq = pow(dos,i);//tamaño de onda(octava)
          perlin = perlin + interpolatedNoise(x*freq, y*freq)*ampl;
          totalAmpl += ampl;
	  ampl /= persistencia;
      }
      return perlin/totalAmpl; //Normalizar
}

void main(){
    float p = perlinNoise2D(vtexCoord.s,vtexCoord.t);
    //fragColor = mix(vec4(1.0,1.0,0.0,1.0),vec4(1.0,0.0,0.0,1.0),1-p);//Efecto fuego
    fragColor = mix(vec4(0.5,0.5,0.5,1.0),vec4(1.0,1.0,1.0,0.0),1-p); //Efecto niebla
    //fragColor = mix(vec4(1.0,1.0,1.0,1.0),vec4(0.1,0.2,0.7,1.0),1-p); //Efecto cielo tapado

}
