project(
  'llc.snow.lsp',
  'vala', 'c',
  version: '0.1.0'
)

vapi_dir = meson.current_source_dir() / 'vapi'

# subdir('src')

jsonrpc_glib_proj = subproject('jsonrpc-glib', default_options: [
  'with_introspection=true',
  'with_vapi=true',
  'enable_gtk_doc=false',
  'enable_tests=false'
])
libjsonrpc_glib_dep = jsonrpc_glib_proj.get_variable('libjsonrpc_glib_dep')
libjsonrpc_glib_vapi = jsonrpc_glib_proj.get_variable('libjsonrpc_glib_vapi')

add_project_arguments([
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
  ],
  language: 'c',
)

add_project_arguments(
  ['--vapidir', vapi_dir],
  language: 'vala'
)

executable(
  meson.project_name(),
  'src/server/LanguageServer.vala',
  dependencies: [
    libjsonrpc_glib_dep,
    libjsonrpc_glib_vapi,
    dependency('json-glib-1.0'),
    dependency('gee-0.8'),
    dependency('gio-unix-2.0'),
    meson.get_compiler('vala').find_library('posix'),
  ],
  install: true
)
