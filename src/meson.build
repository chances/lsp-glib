sources = files([
  'client/LanguageClient.vala',
  'protocol/Header.vala',
  'server/LanguageServer.vala',
])

API_VERSION = '@0@.@1@'.format(lsp_glib_version_major, lsp_glib_version_minor)

liblsp_glib = library(
  'lsp-glib-' + API_VERSION,
  sources,
  version: API_VERSION,
  install: true,
)

if g_ir_compiler.found()
  custom_target('liblsp-glib-typelib',
    command: [
      g_ir_compiler,
      '--shared-library', 'liblsp-glib-@0@.so'.format (lsp_glib_version_major),
      '--output', '@OUTPUT@',
      meson.current_build_dir() / 'LibLSP-' + API_VERSION + '.gir'
    ],
    output: 'LibLSP-' + API_VERSION + '.typelib',
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
