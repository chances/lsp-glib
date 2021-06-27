using Gee;

namespace Lsp {
    // https://valadoc.org/jsonrpc-glib-1.0/Jsonrpc.Server.html
    public class LanguageServer : Jsonrpc.Server {
        public ArrayList<uint> handlers { get; default = new ArrayList<uint> (); }

        public static void msg_handler (Jsonrpc.Server self, Jsonrpc.Client client, string method, Variant id, Variant @params) {
            // TODO: LSP message handler
        }
    }
}
