load 'lib/red_rug.rb'

Gem::Specification.new do |s|
  s.name            =   'redrug'
  s.version         =   RedRug.version
  s.authors         =   ['Chad Perrin']
  s.date            =   '2012-09-20'
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
    'lib/red_rug.rb'
  ]
  s.homepage        =   'http://redrug.fossrec.com'
  s.has_rdoc        =   false
  s.license         =   'OWL'

  s.post_install_message    =   <<-EOF
    Thank you for using RedRug.  Require "red_rug" to load this library.
  EOF

  s.required_ruby_version   =   '>= 1.9.3'
  s.add_runtime_dependency 'redcarpet'
end
