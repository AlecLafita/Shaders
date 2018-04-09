#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax; 

void main(){

    float minY = boundingBoxMin.y;
    float maxY = boundingBoxMax.y;
    vec3 col;
    float porc = (maxY - minY)/4;

    if ( vertex.y < (minY + porc) ) {
	float perc = (vertex.y - minY)/porc;
	col = mix(vec3(1,0,0),vec3(1,1,0),perc);
    } 

    else if ( vertex.y < (minY + 2*porc)) {
	float perc = (vertex.y - minY - porc)/porc;
	col = mix(vec3(1,1,0),vec3(0,1,0),perc);
    }

    else if ( vertex.y < (minY + 3*porc) ) {
	float perc = (vertex.y - minY - 2*porc)/porc;
	col = mix(vec3(0,1,0),vec3(0,1,1),perc);
    }

    else if ( vertex.y <= maxY) {
	float perc = (vertex.y - minY - 3*porc)/porc;
	col = mix(vec3(0,1,1),vec3(0,0,1),perc);
    }
	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(col,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
