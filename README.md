# Vala Language Server Protocol

<!-- ![Vala LSP CI](https://github.com/chances/vala-language-server-protocol/workflows/Vala%20LSP%20CI/badge.svg?branch=master) -->
<!-- [![codecov](https://codecov.io/gh/chances/vala-language-server-protocol/branch/master/graph/badge.svg?token=bL2FkBtfPK)](https://codecov.io/gh/chances/vala-language-server-protocol) -->

An implementation of the [Language Server Protocol](https://github.com/Microsoft/language-server-protocol) written entirely in Vala.

# Concepts

## JSON-RPC

We use the [jsonrpc-glib](https://gitlab.gnome.org/GNOME/jsonrpc-glib) implementation of [JSON-RPC](https://www.jsonrpc.org/specification).

<!-- For more information about using the `JsonRpcServer` on it's own [here](./docs/jsonrpc.md). -->

## Language Server Protocol

We strive to ensure that we implement all the types, request and notifications that are defined by the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/). Sometimes this is difficult due to the nature of LSP TypeScript upbringing, but the goal is 100% conformance with the protocol itself.

<!-- For more information about using the `LanguageClient` / `LanguageServer` on it's own [here](./docs/lsp.md). -->

<!--
## Debug Adapter Protocol
We strive to ensure that we implement all the types, events and requests that are defined by the [Debug Adapter Protocol](https://microsoft.github.io/debug-adapter-protocol/).

For more information about using the `DebugAdapterClient` / `DebugAdapterServer` on it's own [here](./docs/dap.md).
-->

## License

[MIT License](https://opensource.org/licenses/MIT)

Copyright &copy; 2021 Snow Developments, LLC. All rights reserved.
