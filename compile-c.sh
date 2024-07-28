# compile-c-code.sh
#!/bin/bash

# Compile engine.c into a shared library
gcc -shared -o libwebkit_browser.so -fPIC engine.c `pkg-config --cflags --libs webkit2gtk-4.0`
