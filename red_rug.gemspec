load 'lib/red_rug.rb'

Gem::Specification.new do |s|
  s.name            =   'redrug'
  s.version         =   RedRug.version
  s.authors         =   ['Chad Perrin']
  s.date            =   '2015-08-19'
  s.description     =   <<-EOF
    RedRug is a wrapper for Redcarpet, intended to provide more convenient
    interfaces for common Markdown parsing use cases.
  EOF
  s.summary         =   'RedRug - Simple Markdown Interface'
  s.email           =   'code@apotheon.net'
  s.files           =   [
    'COPYING',
    'LICENSE',
    'README',
    'lib/red_rug.rb',
    'bin/redrug',
    'spec/red_rug_spec.rb',
    'spec/spec_helper.rb'
  ]
  s.homepage        =   'http://fossrec.com/u/apotheon/redrug'
  s.has_rdoc        =   true
  s.license         =   'DPL'
  s.bindir          =   'bin'
  s.executables     =   ['redrug']

  s.post_install_message    =   <<-EOF
    Thank you for using RedRug.  Require "red_rug" to load this library.
    The "redrug" command line utility takes a filename argument and outputs
    the contents of the file translated from Markdown to HTML.  Usage and
    option help for it can be had via the "-h" option.
  EOF

  s.required_ruby_version   =   '>= 1.9.2'
  s.add_runtime_dependency 'redcarpet'
  s.add_runtime_dependency 'versionize'
end
