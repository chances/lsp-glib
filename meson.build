project(
  'llc.snow.lsp',
  'vala', 'c',
  version: '0.1.0'
)

lsp_glib_version = meson.project_version().split('.')
lsp_glib_version_major = lsp_glib_version[0].to_int()
lsp_glib_version_minor = lsp_glib_version[1].to_int()
lsp_glib_version_patch = lsp_glib_version[2].to_int()

jsonrpc_glib_proj = subproject('jsonrpc-glib', default_options: [
  'with_introspection=true',
  'with_vapi=true',
  'enable_gtk_doc=false',
  'enable_tests=false'
])
libjsonrpc_glib_dep = jsonrpc_glib_proj.get_variable('libjsonrpc_glib_dep')
libjsonrpc_glib_vapi = jsonrpc_glib_proj.get_variable('libjsonrpc_glib_vapi')
libjsonrpc_glib_sources = join_paths( meson.current_build_dir(), 'subprojects/jsonrpc-glib/src' )

liblsp_glib_include_dirs = include_directories('.')
liblsp_glib_deps = [
  dependency('gee-0.8'),
  dependency('gio-unix-2.0'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('json-glib-1.0'),
  libjsonrpc_glib_dep,
  libjsonrpc_glib_vapi,
  meson.get_compiler('vala').find_library('posix'),
]
PKGCONFIG_DEPS = ['gee-0.8', 'gio-2.0', 'gio-unix-2.0', 'glib-2.0', 'gobject-2.0', 'json-glib-1.0', 'jsonrpc-glib-1.0']

add_project_arguments([
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
  ],
  language: 'c',
)

vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(
  [
    '--enable-experimental',
    '--vapidir', vapi_dir,
  ],
  language: 'vala'
)

# GObject Introspection Generation
g_ir_compiler = find_program('g-ir-compiler', required: false)

subdir('src')
subdir('tests')
