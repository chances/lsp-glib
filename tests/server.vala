using Lsp;

public int main (string[] args) {
    message ("Starting LSP Server…");
    var server = new LanguageServer ();

    var event_loop = new MainLoop ();
    var timeout = new TimeoutSource (2000);
    timeout.set_callback (() => {
        print ("Time!\n");
        event_loop.quit ();
        return false;
    });
    timeout.attach (event_loop.get_context ());

    // TODO: Bootstrap the server
    server.handlers.add (server.add_handler ("msg", LanguageServer.msg_handler));
    server.client_accepted.connect ((s, client) => message ("Client connected"));
    server.client_closed.connect ((s, client) => message ("Client disconnected"));
    message ("Started LSP Server.");

    event_loop.run ();
    message ("LSP Server stopped.");
    return 0;
}
