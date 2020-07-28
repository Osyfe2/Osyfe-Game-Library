# Osyfe-Game-Library

This small Java game library is based on LWJGL 3 and constitutes a rather thin wrapper around the core functionality with the goal to hide completely the native libraries, yet leaving open some relevant low level details, and additional utilities.

This is not intended to be an engine, e.g. there will be no scene graph, you will to have to write your own shaders etc.
Nonetheless, the library removes verbose and error prone parts of the interaction with the native libraries LWJGL exposes, e.g. setting up VBOs correctly.

The provided features are mainly driven by personal use, implying that most likely it will cover only basic functionality. Also, the library sticks to some fixed choices, such as the OpenGL 3.3 core profile.
However, besides that, it is designed with transparency in mind, such that the user knows when which kind of native calls are performed, preserving easy extendibility.