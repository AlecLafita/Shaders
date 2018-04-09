#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 72) out;

in vec4 vfrontColor[];
in vec3 N[];
out vec4 gfrontColor;
out vec3 normal;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat3 normalMatrix;

void main( void )
{
	float d = length(boundingBoxMax-boundingBoxMin);
	gfrontColor = (vfrontColor[0] + vfrontColor[1] + vfrontColor[2])/3;
	normal = normalize(N[0] + N[1] + N[2]);
	for( int i = 0 ; i < 3 ; i++ ){ //vertexs normals
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
        EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ ){ //un octaedre per vertex
		vec4 v1 = gl_in[i].gl_Position + vec4(0.01*d,0,0,0);//+x
		vec4 v2 = gl_in[i].gl_Position - vec4(0.01*d,0,0,0);//-x
		vec4 v3 = gl_in[i].gl_Position + vec4(0,0.01*d,0,0);//+y
		vec4 v4 = gl_in[i].gl_Position - vec4(0,0.01*d,0,0);//-y
		vec4 v5 = gl_in[i].gl_Position + vec4(0,0,0.01*d,0);//+z
		vec4 v6 = gl_in[i].gl_Position - vec4(0,0,0.01*d,0);//-z
		gfrontColor = vfrontColor[i];

		normal = normalMatrix*cross((v3-v1).xyz,(v5-v1).xyz);//vermella
		gl_Position = modelViewProjectionMatrix*v3;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v1;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v5;
		EmitVertex();
	        EndPrimitive();

		normal = -normal; //inversa a vermella
		gl_Position = modelViewProjectionMatrix*v6;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v4;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v2;
		EmitVertex();
	        EndPrimitive();

		normal = normalMatrix*cross((v5-v1).xyz,(v4-v1).xyz);//verda
		gl_Position = modelViewProjectionMatrix*v5;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v1;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v4;
		EmitVertex();
	        EndPrimitive();

		normal = -normal;//inversa a verda
		gl_Position = modelViewProjectionMatrix*v2;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v3;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v6;
		EmitVertex();
	        EndPrimitive();

		normal = normalMatrix*cross((v2-v5).xyz,(v4-v5).xyz);//blava
		gl_Position = modelViewProjectionMatrix*v2;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v4;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v5;
		EmitVertex();
	        EndPrimitive();

		normal = -normal;//inversa a blava
		gl_Position = modelViewProjectionMatrix*v1;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v3;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v6;
		EmitVertex();
	        EndPrimitive();

		normal = normalMatrix*cross((v3-v5).xyz,(v2-v5).xyz); //groga
		gl_Position = modelViewProjectionMatrix*v3;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v5;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v2;
		EmitVertex();
	        EndPrimitive();

		normal = -normal; //inversa a groga
		gl_Position = modelViewProjectionMatrix*v1;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v6;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix*v4;
		EmitVertex();
	        EndPrimitive();
	}

}
