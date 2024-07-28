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
