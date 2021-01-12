namespace Lsp {
    /**
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#headerPart
     */
    struct Header {
        size_t content_length;
        string content_type;
    }

    // https://valadoc.org/gio-2.0/GLib.IOStream.html Has:
    // - https://valadoc.org/gio-2.0/GLib.InputStream.html
    // - https://valadoc.org/gio-2.0/GLib.OutputStream.splice.html

    // https://valadoc.org/gio-2.0/GLib.ConverterOutputStream.html
}
