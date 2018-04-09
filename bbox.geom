#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform float time;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main( void )
{
   if(fract(time)>=0.5) {	
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
        EndPrimitive();
   }

   else if(gl_PrimitiveIDIn == 0){
	vec3 v1 = vec3(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMin.z);
	vec3 v2 = vec3(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMin.z);
	vec3 v3 = vec3(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMax.z);
	vec3 v4 = vec3(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMax.z);

	vec3 v5 = vec3(boundingBoxMin.x,boundingBoxMax.y,boundingBoxMin.z);
	vec3 v6 = vec3(boundingBoxMax.x,boundingBoxMax.y,boundingBoxMin.z);
	vec3 v7 = vec3(boundingBoxMax.x,boundingBoxMax.y,boundingBoxMax.z);
	vec3 v8 = vec3(boundingBoxMin.x,boundingBoxMax.y,boundingBoxMax.z);

	vec3 N = normalize(normalMatrix*cross(v2-v1,v4-v1));//Cara -y
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v1,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v2,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v4,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v3,1.0);
	EmitVertex();
	EndPrimitive();

	N = normalize(normalMatrix*cross(v8-v5,v6-v5));//Cara +y
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v5,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v6,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v8,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v7,1.0);
	EmitVertex();
	EndPrimitive();

	N = normalize(normalMatrix*cross(v4-v8,v7-v8)); //Cara +z
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v8,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v7,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v4,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v3,1.0);
	EmitVertex();
	EndPrimitive();

	N = normalize(normalMatrix*cross(v5-v1,v2-v1));//Cara -z
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v1,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v2,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v5,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v6,1.0);
	EmitVertex();
	EndPrimitive();

	N = normalize(normalMatrix*cross(v7-v6,v2-v6)); //Cara +x
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v6,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v7,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v2,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v3,1.0);
	EmitVertex();
	EndPrimitive();

	N = normalize(normalMatrix*cross(v8-v4,v1-v4)); //Cara -x
	gfrontColor = vec4(0.0,0.0,1.0,1.0)*N.z; 
	gl_Position = modelViewProjectionMatrix*vec4(v1,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v4,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v5,1.0);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(v8,1.0);
	EmitVertex();
	EndPrimitive();
  }
}
