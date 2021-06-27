project(
  'lsp-server',
  'vala', 'c',
  version: '0.1.0'
)

exe_test_server = executable(
  meson.project_name(),
  'server.vala',
  link_with : liblsp_glib,
  dependencies: liblsp_glib_dep
)
