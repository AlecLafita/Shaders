#version 330 core

out vec4 fragColor;
in vec3 normal;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix*normal);
    fragColor = vec4(0.5,0.5,0.5,1.0)*N.z;
}
