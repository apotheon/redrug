# redrug

The redcarpet library can be a bit cumbersome to use, and redrug aims to
rectify this problem by wrapping it with simpler interfaces for common use
cases.

## Installation

The simple way to install redrug is to use the gem command:

      $ gem install redrug

You can also build from source and install it the "hard" way.  To do this,
first clone the sources to your local system using Fossil SCM:

      $ fossil clone http://redrug.fossrec.com redrug.fossil

Then, open the repository in an appropriate directory:

      $ mkdir redrug
      $ cd redrug
      $ fossil open ../redrug.fossil

Finally, build and install, where in this example the N.N.N sequence is a
series of numbers indicating the current version number of the gem.

      $ gem build red_rug.gemspec
      $ gem install redrug-N.N.N.gem

## Rails Usage

The most convenient use of RedRug with Rails is probably as an application
helper.  The following example assumes that approach.

First, stick it in your Gemfile:

      gem 'redrug'

Next, make sure you install it:

      $ bundle install

Finally (and this is the "hard" part, of course), set up a helper in your
project's `app/helpers/application_helper.rb` (though if you are only going to
use it in very limited contexts, you may want to stick it in some other helper
within `app/helpers/`):

      # whatever other requires you need
      require 'red_rug'
    
      module ApplicationHelper
        # whatever other helper methods you've defined
    
        def markdown text
          RedRug.to_html(text).html_safe
        end
      end

You can then use it wherever you need to parse Markdown by executing the
`markdown` method, most likely in views.  For instance, there's always this
common pattern, in (for instance) your `app/views/profiles/show.html.erb` view:

      <h2><%= @article.title %></h2>
    
      <%= markdown @article.body %>

Voila: Markdown enhanced blogging.

### HTML Safety

Alas, the simplistic approach above may expose you to the dangers of unescaped
HTML input from users.  The following rewrite of the `markdown` helper method
as two methods provides both a way to escape any HTML in the input Markdown
text and a way to leave HTML unescaped when you trust the source of the
Markdown text and want to allow HTML to pass through unmolested:

      module ApplicationHelper
        # whatever other helper methods you've defined
    
        # use this for input you do not trust
        def markdown text
          RedRug.to_html(h text).html_safe
        end
    
        # use this for input you trust, if you really really must
        def septic_markdown text
          RedRug.to_html(text).html_safe
        end
      end

Since RedRug version 0.3.0, you have another alternative that relies on
Redcarpet's own HTML escaping capabilities.  If you wish to use that instead of
the Rails `h` helper, you can do this with the HTML-escaped version of your
RedRug-based Markdown helper:

      module ApplicationHelper
        # . . .
    
        def markdown text
          RedRug.to_html(text, escape_html: true).html_safe
        end
      
        # . . .
      end

## Library Usage

At this time, the RedRug module provides a very simple API for translating
Markdown into HTML.  The basic use case examples are as follows:

      require 'red_rug'
    
      RedRug.from_file '/path/to/filename.md'
    
      RedRug.to_html <<END
        # This Is A Markdown Heading
    
        This is how paragraphs look in Markdown.
      END

## Command Line Usage

The redrug gem provides a `redrug` command line utility that takes a Markdown
formatted file as input and translates it into HTML, dumping the results to
standard output.  The usual approach would be to use a redirect to send the
output to a persistent file instead:

      $ redrug filename.md > filename.html

This translates the contents of a Markdown formatted file, `filename.md`, into
HTML, then writes that HTML into a file called `filename.html`.

It can also accept Markdown from standard input, so commands such as the
following examples should also work:

      $ cat file1.md file2.md file3.md | redrug > filename.html
      $ redrug < filename.md > filename.html

The usual Unix pipeline rules apply.

As of RedRug version 0.3.0, the `redrug` utility also accepts a command line
option for escaping HTML before parsing Markdown:

      $ redrug -e filename.md

Simply put, `-e` employs Redcarpet's `:html_escape` parsing option to escape
HTML before parsing any Markdown.  Otherwise, the behavior of the `redrug`
utility has not changed.

## Bugs And Feature Requests

To file a bug report, feature request, or other issue, please log in as
"anonymous" using the temporary password provided on the login page, then click
the Tickets link and select New Ticket.  Select the appropriate issue type
before submitting.

## Other

For more information, see either the [redrug project page][redrug] or the
[redrug Rubygems page][rubygem].

[redrug]: http://fossrec.com/u/apotheon/redrug
[rubygem]: http://rubygems.org/gems/redrug
