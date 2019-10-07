//The library expects the vertex and fragment shaders in one file separated by ###.
//Since the engine uses OpenGL3.3 we have to specify the corresponding GLSL version here.

#version 330 core

//The 2D vertex positions (in pixels)
in ivec2 model_position;
//The glyph atlas coordinates.
in vec2 surface_coords;

//The passed glyph atlas coordinates.
out vec2 tex_coords;

//The height of the font in pixels.
uniform int height_int;
//The height of the font in screen coordinates.
uniform float height_float;
//The aspect ratio of the screen.
uniform float aspect;
//The offset position of the text in screen coordinates.
uniform vec2 offset;

void main()
{
   tex_coords = surface_coords;
   float scale = height_float / float(height_int);
   gl_Position = vec4(float(model_position.x) * scale / aspect + offset.x, float(model_position.y) * scale + offset.y, 0, 1);
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