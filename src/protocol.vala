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

    /**
     * The offsets are based on a UTF-16 string representation.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#position
     */
    struct Position {
        uint line;
        /**
         * Character offset on a line in a document (zero-based). Assuming that
         * the line is represented as a string, the `character` value represents
         * the gap between the `character` and `character + 1`.
         *
         * If the character value is greater than the line length it defaults back
         * to the line length.
         */
        uint position;
    }

    /**
     * A range in a text document expressed as (zero-based) start and end positions. A range is
     * comparable to a selection in an editor. Therefore the end position is exclusive. If you
     * want to specify a range that contains a line including the line ending character(s) then
     * use an end position denoting the start of the next line.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#range */
    struct Range {
        Position start;
        Position end;
    }

    /**
     * Represents a location inside a resource, such as a line inside a text file.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#location
     */
    struct Location {
        string uri;
        Range range;
    }

    /**
     * Represents a link between a source and a target location.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#locationLink
     */
    struct LocationLink {
        /**
         * Span of the origin of this link.
         *
         * Used as the underlined span for mouse interaction. Defaults to the word
         * range at the mouse position.
         */
        Range* origin_selection_range;
        /** The target resource identifier of this link. */
        string target_uri;
        /**
         * The full target range of this link. If the target for example is a symbol
         * then target range is the range enclosing this symbol not including
         * leading/trailing whitespace but everything else like comments. This
         * information is typically used to highlight the range in the editor.
         */
        Range target_range;
        /**
         * The range that should be selected and revealed when this link is being
         * followed, e.g the name of a function. Must be contained by the the
         * `targetRange`. See also `DocumentSymbol#range`
         */
        Range target_selection_range;
    }

    /**
     * Represents a diagnostic, such as a compiler error or warning. Diagnostic objects are
     * only valid in the scope of a resource.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#diagnostic
     */
    struct Diagnostic {
        Range range;
        string* code;
        string message;
    }

    /** @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#command */
    struct Command {
        /** Title of the command, like `save`. */
        string title;
        /** The identifier of the actual command handler. */
        string command;
        //  string** arguments;
    }

    /**
     * A textual edit applicable to a text document.
     * @see https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textEdit
     */
    struct TextEdit {
        /**
         * The range of the text document to be manipulated. To insert
         * text into a document create a range where start === end.
         */
        Range range;
        /**
         * The string to be inserted. For delete operations use an
         * empty string.
         */
        string new_text;
    }
}
