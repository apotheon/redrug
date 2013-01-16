load 'lib/red_rug.rb'

Gem::Specification.new do |s|
  s.name            =   'redrug'
  s.version         =   RedRug.version
  s.authors         =   ['Chad Perrin']
  s.date            =   '2013-01-15'
  s.description     =   <<-EOF
    RedRug is a wrapper for Redcarpet, intended to provide more convenient
    interfaces for common Markdown parsing use cases.
  EOF
  s.summary         =   'RedRug - Simple Markdown Interface'
  s.email           =   'code@apotheon.net'
  s.files           =   [
    'COPYING',
    'README',
    'owl.txt',
    'lib/red_rug.rb',
    'bin/redrug'
  ]
  s.homepage        =   'http://redrug.fossrec.com'
  s.has_rdoc        =   true
  s.license         =   'OWL'
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
end
