project(
  'llc.snow.lsp',
  'vala', 'c',
  version: '0.1.0'
)

# subdir('src')

jsonrpc_glib_proj = subproject('jsonrpc-glib')
libjsonrpc_glib_dep = jsonrpc_glib_proj.get_variable('libjsonrpc_glib_dep')

add_project_arguments([
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
  ],
  language: 'c',
)

add_project_arguments(
  ['--vapidir', join_paths(meson.current_source_dir(), 'vapi')],
  language: 'vala'
)

executable(
  meson.project_name(),
  'src/server/LanguageServer.vala',
  dependencies: [
    libjsonrpc_glib_dep,
    dependency('json-glib-1.0'),
    dependency('gio-unix-2.0'),
  ],
  install: true
)
