exe_test_server = executable(
  meson.project_name() + '-test-server',
  'server.vala',
  link_with : liblsp_glib,
  dependencies: liblsp_glib_dep
)
test('test-server', exe_test_server)
