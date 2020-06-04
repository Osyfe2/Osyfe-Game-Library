//The library expects the vertex and fragment shaders in one file separated by ###.
//Since the engine uses OpenGL3.3 we have to specify the corresponding GLSL version here.

#version 330 core

//The 2D vertex positions
in vec2 model_position;
//The glyph atlas coordinates.
in vec2 surface_coords;

//The passed glyph atlas coordinates.
out vec2 tex_coords;

//The offset position of the text in screen coordinates.
uniform vec2 offset;

void main()
{
   tex_coords = surface_coords;
   gl_Position = vec4(model_position + offset, 0, 1);
}
###

#version 330 core

in vec2 tex_coords;

//The output color.
out vec4 frag_color;

//The text color.
uniform vec4 textcolor;
//The glyph atlas;
uniform sampler2D bitmap;

void main()
{
   float alpha = texture(bitmap, tex_coords).a;
   frag_color = textcolor * vec4(1, 1, 1, alpha);
}