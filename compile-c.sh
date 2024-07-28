# compile-c-code.sh
#!/bin/bash

# Set paths to WebKitGTK libraries and include files
WEBKIT_INCLUDE_PATH=/path/to/WebKit/Source/WebKit
WEBKIT_LIB_PATH=/path/to/WebKit/WebKitBuild/Release

# Compile engine.c into a shared library
gcc -shared -o libwebkit_browser.so -fPIC engine.c -I${WEBKIT_INCLUDE_PATH} -L${WEBKIT_LIB_PATH} -lwebkit2gtk-4.0 -lgtk-3
