# compile-c-code.sh
#!/bin/bash

# Get WebKitGTK include and library paths
WEBKIT_INCLUDE_PATH=$(flatpak info --show-location org.webkit.WebKitGtk)/include
WEBKIT_LIB_PATH=$(flatpak info --show-location org.webkit.WebKitGtk)/lib

# Compile engine.c into a shared library
gcc -shared -o libwebkit_browser.so -fPIC engine.c -I${WEBKIT_INCLUDE_PATH} -L${WEBKIT_LIB_PATH} -lwebkit2gtk-4.0 -lgtk-3
