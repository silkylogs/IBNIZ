gcc ^
ui_sdl.c vm_slow.c clipboard.c compiler.c ^
-o ibniz.exe ^
-L./SDL-1.2.14/lib -I./SDL-1.2.14/include ^
-static -lmingw32 SDL-1.2.14/lib/libSDLmain.a SDL-1.2.14/lib/libSDL.dll.a -lwinmm -lm -mwindows