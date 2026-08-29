#version 460

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec3 inTextCoord;

layout(set = 0, biding = 0) uniform Light
{
	mat4 PVMatrix;
}LightUBO;

layout(push_constant) uniform MeshInfo
{
	mat4 ModelMatrix;
	mat4 NormalMatrix;
}MeshUBO;

void main()
{
	gl_position = LightUBO.PVMatrix * MeshUBO.ModelMatrix * vec4(inPosition, 1.0);
}