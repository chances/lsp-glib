using Gee;

namespace Lsp {
    // https://valadoc.org/jsonrpc-glib-1.0/Jsonrpc.Server.html
    public class LanguageServer : Jsonrpc.Server {
        public ArrayList<uint> handlers { get; default = new ArrayList<uint> (); }

        public static int main (string[] args) {
            message ("Starting LSP Server…");
            var server = new LanguageServer ();

            var event_loop = new MainLoop ();
            var interrupt_signal = new Unix.SignalSource (Posix.Signal.INT);
            interrupt_signal.set_callback (() => {
                stdout.printf ("\n");
                message ("Stopping server gracefully…");
                // TODO: Disconnect from clients?
                foreach (uint id in server.handlers) {
                    server.remove_handler (id);
                    server.handlers.remove (id);
                }
                event_loop.quit ();
                return GLib.Source.REMOVE;
            });
            interrupt_signal.attach (event_loop.get_context ());
            // TODO: Add an `IOSource` to handle CLI input? (https://valadoc.org/glib-2.0/GLib.IOSource.html)

            // TODO: Bootstrap the server
            server.handlers.add (server.add_handler ("msg", LanguageServer.msg_handler));
            server.client_accepted.connect ((s, client) => message ("Client connected"));
            server.client_closed.connect ((s, client) => message ("Client disconnected"));
            message ("Started LSP Server.");

            event_loop.run ();
            message ("LSP Server stopped.");
            return 0;
        }

        static void msg_handler (Jsonrpc.Server self, Jsonrpc.Client client, string method, Variant id, Variant @params) {
            // TODO: LSP message handler
        }
    }
}
