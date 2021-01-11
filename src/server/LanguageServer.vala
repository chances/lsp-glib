public class LanguageServer {
  public static int main (string[] args) {
    // https://valadoc.org/jsonrpc-glib-1.0/Jsonrpc.Server.html
    var server = new Jsonrpc.Server ();
    // TODO: Bootstrap the server:
    server.add_handler ("msg", LanguageServer.msgHandler);
    server.client_accepted.connect ((s, client) => stdout.printf ("Client connected"));
    server.client_closed.connect ((s, client) => stdout.printf ("Client disconnected"));

    return 0;
  }

  static void msgHandler (Jsonrpc.Server self, Jsonrpc.Client client, string method, Variant id, Variant @params) {
    // TODO: LSP message handler
  }
}
