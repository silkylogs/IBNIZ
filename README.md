# IBNIZ

IBNIZ is a virtual machine designed for extremely compact low-level audiovisual programs. The leading design goal is usefulness as a platform for demoscene productions, glitch art and similar projects. Mainsteam software engineering aspects are considered totally irrelevant.

IBNIZ stands for Ideally Bare Numeric Impression giZmo. The name also refers to Gottfried Leibniz, the 17th-century polymath who, among all, invented binary arithmetic, built the first four-operation calculating machine, and believed that the world was designed with the principle that a minimal set of rules should yield a maximal diversity.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aKMrBaXJvMs
" target="_blank"><img src="http://img.youtube.com/vi/aKMrBaXJvMs/0.jpg" 
alt="Demo Video" width="240" height="180" border="10" /></a>

* [Demo video](https://www.youtube.com/watch?v=aKMrBaXJvMs)
* [Documentation](src/ibniz.txt)
* [Web site](http://viznut.fi/ibniz/)
* Community: `#countercomplex` @ IRCnet
* [Javascript implementation](http://ibniz.breizh-entropy.org/) ([git](https://github.com/asiekierka/ibnjs))
* [Another Javascript implementation](https://flupe.github.io/jibniz/) ([git](https://github.com/flupe/jibniz))

## Building

### Windows
Prerequisites:
- [MSYS2 MinGW](https://www.msys2.org/)
- [SDL2-devel-2.0.22-VC](https://github.com/libsdl-org/SDL/releases/tag/release-2.0.22) (V2.0.22 linked here but any version satisfying 2.0.X will do)
- [SDL12-compat](https://github.com/libsdl-org/sdl12-compat)
- [CMake](https://cmake.org/)

Download and build the compatibility libraries:
```bat
git clone https://github.com/libsdl-org/sdl12-compat.git
cd sdl12-compat
REM extract then copy the sdl2-devel folder you downloaded into this folder
cmake -G "MinGW Makefiles" -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc -DSDL2_INCLUDE_DIR=./SDL2-2.0.22/include .
cmake --build build
cd ..
```

Synthesizing the library directory
```bat
git clone https://github.com/viznut/IBNIZ
cd IBNIZ\src
mkdir SDL-1.2.14
mkdir SDL-1.2.14\lib
mkdir SDL-1.2.14\include

copy ..\..\sdl12-compat\build\libSDL.dll.a .\SDL-1.2.14\lib
copy ..\..\sdl12-compat\build\libSDLmain.a .\SDL-1.2.14\lib
robocopy ..\..\sdl12-compat\include .\SDL-1.2.14\include /s /e
```

Building the application
```bat
gcc ^
    ui_sdl.c vm_slow.c clipboard.c compiler.c ^
    -o ibniz.exe ^
    -L./SDL-1.2.14/lib -I./SDL-1.2.14/include ^
    -static -lmingw32 SDL-1.2.14/lib/libSDLmain.a SDL-1.2.14/lib/libSDL.dll.a -lwinmm -lm
```

### Linux

Prerequisites:
* [SDL](https://www.libsdl.org) v1.2.x

Run these commands:
```
cd src
make
```

### MacOS

Prerequisites:
* Apple developer tools (installed with Xcode)
* [SDL](https://www.libsdl.org) v1.2.x (an easy way to get SDL is via [Homebrew](https://brew.sh) `brew install sdl`)

Run these commands:
```
cd src
make -f Makefile.osx
```


