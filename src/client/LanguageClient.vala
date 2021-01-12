namespace Lsp {
    public class LanguageClient : Jsonrpc.Client {
        public LanguageClient (IOStream io_stream) {
            // Workaround Jsonrpc.Client has_construct_function=false
            // https://stackoverflow.com/a/29873092/1363247
            Object (io_stream: io_stream, use_gvariant: false);
        }

        /**
         * Denotes if {@link Variant} should be used to communicate with the peer instead of JSON.
         * Always `true` in instances of {@link LanguageClient}.
         */
        public new bool use_gvariant { get; default = false; }
    }
}
