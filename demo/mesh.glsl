//The library expects the vertex and fragment shaders in one file separated by ###.
//Since the engine uses OpenGL3.3 we have to specify the corresponding GLSL version here.

#version 330 core

//The 3D vertex position.
in vec3 model_position;
//The vertex colors.
in vec3 color;

//The passed vertex color which gets interpolated along the primitives.
out vec3 col;

//The transformation matrix for world to view space.
uniform mat4 view_world;
//The transformation matrix for view to clip space.
uniform mat4 clip_view;

void main()
{
   col = color;
   gl_Position = clip_view * view_world * vec4(model_position, 1);
}

###

#version 330 core

in vec3 col;

//The output color.
out vec4 frag_color;

void main()
{
   frag_color = vec4(col, 1);
}