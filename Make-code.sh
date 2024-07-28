# make-code.sh
#!/bin/bash

# Create engine.c
cat << 'EOF' > engine.c
#include <webkit2/webkit2.h>
#include <gtk/gtk.h>

// Function to initialize GTK and WebKit
void start_browser(const char* url) {
    gtk_init(NULL, NULL);
    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "yewgamer browser");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    GtkWidget *webview = webkit_web_view_new();
    gtk_container_add(GTK_CONTAINER(window), webview);
    webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webview), url);

    gtk_widget_show_all(window);
    gtk_main();
}
EOF

# Create main.py
cat << 'EOF' > main.py
import tkinter as tk
from tkinter import simpledialog
import ctypes

# Load the C library
webkit_lib = ctypes.CDLL("./libwebkit_browser.so")

# Define the function prototype
webkit_lib.start_browser.argtypes = [ctypes.c_char_p]

# Function to open the browser
def open_browser():
    url = simpledialog.askstring("Input", "Enter URL:", parent=root)
    if url:
        webkit_lib.start_browser(url.encode("utf-8"))

# Create the main window
root = tk.Tk()
root.title("yewgamer browser")
root.geometry("400x200")

# Create and place the button
button = tk.Button(root, text="Open Browser", command=open_browser)
button.pack(pady=20)

# Run the Tkinter main loop
root.mainloop()
EOF