project(
  'llc.snow.lsp',
  'vala', 'c',
  version: '0.1.0'
)

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
        dependency('gio-unix-2.0')
    ],
    install: false
)
