namespace Lsp {
    public class LanguageClient : Jsonrpc.Client {
        public LanguageClient (IOStream io_stream) {
            // Workaround Jsonrpc.Client has_construct_function=false
            // https://stackoverflow.com/a/29873092/1363247
            Object (io_stream: io_stream);
        }
    }
}
