import tkinter as tk
from tkinter import simpledialog
import ctypes

# Load the C library
webkit_lib = ctypes.CDLL('./libwebkit_browser.so')

# Define the function prototype
webkit_lib.start_browser.argtypes = [ctypes.c_char_p]

# Function to open the browser
def open_browser():
    url = simpledialog.askstring("Input", "Enter URL:", parent=root)
    if url:
        webkit_lib.start_browser(url.encode('utf-8'))

# Create the main window
root = tk.Tk()
root.title("yewgamer browser")
root.geometry("400x200")

# Create and place the button
button = tk.Button(root, text="Open Browser", command=open_browser)
button.pack(pady=20)

# Run the Tkinter main loop
root.mainloop()
