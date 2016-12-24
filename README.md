# redrug

The redcarpet library can be a bit cumbersome to use, and redrug aims to
rectify this problem by wrapping it with simpler interfaces for common use
cases.

## Command Line Usage

The redrug gem provides a `redrug` command line utility that takes a Markdown
formatted file as input and translates it into HTML, dumping the results to
standard output.  The usual approach would be to use a redirect to send the
output to a persistent file instead:

    $ redrug filename.md > filename.html

This translates the contents of a Markdown formatted file, `filename.md`, into
HTML, then writes that HTML into a file called `filename.html`.