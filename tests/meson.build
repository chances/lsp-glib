exe_test_server = executable(
  meson.project_name() + '-test-server',
  'server.vala',
  link_with : liblsp_glib,
  dependencies: [
    libjsonrpc_glib_dep,
    libjsonrpc_glib_vapi,
    dependency('json-glib-1.0'),
    dependency('gee-0.8'),
    dependency('gio-unix-2.0'),
    meson.get_compiler('vala').find_library('posix'),
  ]
)
test('test-server', exe_test_server)
