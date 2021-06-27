sources = files([
  'client/LanguageClient.vala',
  'protocol.vala',
  'server/LanguageServer.vala',
])

API_VERSION = '@0@.@1@'.format(lsp_glib_version_major, lsp_glib_version_minor)

liblsp_glib = library(
  'lsp-glib-' + API_VERSION,
  sources,
  version: API_VERSION,
  vala_gir: 'Lsp-' + API_VERSION + '.gir',
  dependencies: liblsp_glib_deps,
  vala_args: [
    '--abi-stability'
  ],
  install: true,
)

liblsp_glib_dep = declare_dependency(
              # sources: liblsp_glib_generated_headers,
         dependencies: liblsp_glib_deps,
            link_with: liblsp_glib,
  include_directories: include_directories('.'),
)

if g_ir_compiler.found()
  custom_target('liblsp-glib-typelib',
    command: [
      g_ir_compiler,
      '--shared-library', 'liblsp-glib-@0@.so'.format (API_VERSION),
      '--output', '@OUTPUT@',
      '--includedir', libjsonrpc_glib_sources,
      meson.current_build_dir() / 'Lsp-' + API_VERSION + '.gir'
    ],
    output: 'Lsp-' + API_VERSION + '.typelib',
    depends: liblsp_glib,
    install: true,
    install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))
endif

pkgconfig = import('pkgconfig')
pkgconfig.generate(liblsp_glib,
  subdirs: 'lsp-glib-' + API_VERSION,
  version: API_VERSION,
  name: 'lsp-glib',
  filebase: 'lsp-glib-' + API_VERSION,
  requires: PKGCONFIG_DEPS,
  description: 'A library implementing the Language Server Protocol'
)
