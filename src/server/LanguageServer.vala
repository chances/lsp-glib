using Gee;

public class LanguageServer {
    public static int main (string[] args) {
        message ("Starting LSP Server...");
        // https://valadoc.org/jsonrpc-glib-1.0/Jsonrpc.Server.html
        var server = new Jsonrpc.Server ();
        var handlers = new ArrayList<uint> ();

        var eventLoop = new MainLoop ();
        var interruptSignal = new Unix.SignalSource (Posix.Signal.INT);
        interruptSignal.set_callback (() => {
            message ("Stopping server gracefully...");
            // TODO: Disconnect from clients?
            foreach (uint id in handlers) {
                server.remove_handler (id);
                handlers.remove (id);
            }
            eventLoop.quit ();
            return GLib.Source.REMOVE;
        });
        interruptSignal.attach (eventLoop.get_context ());

        // TODO: Bootstrap the server
        handlers.add (server.add_handler ("msg", LanguageServer.msgHandler));
        server.client_accepted.connect ((s, client) => message ("Client connected"));
        server.client_closed.connect ((s, client) => message ("Client disconnected"));

        eventLoop.run ();
        message ("LSP Server stopped.");
        return 0;
    }

    static void msgHandler (Jsonrpc.Server self, Jsonrpc.Client client, string method, Variant id, Variant @params) {
        // TODO: LSP message handler
    }
}
