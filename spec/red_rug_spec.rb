load '../lib/red_rug.rb'
RSpec.describe RedRug do
  describe 'to_html' do
    it 'returns HTML equivalent of Markdown input' do
      markdown_input = <<-END.gsub(/^ */, '')
        # Heading Level One

        This is a very short paragraph indeed.

        ## Heading Level Two

        Luckily, we have another paragraph, consisting of more than one line.
        It also consists of more than one sentence, though of course RedRug is
        not currently sentence-aware, so far as its developers are aware.
      END

      html_output = <<-END.gsub(/^ */, '')
        <h1>Heading Level One</h1>

        <p>This is a very short paragraph indeed.</p>

        <h2>Heading Level Two</h2>

        <p>Luckily, we have another paragraph, consisting of more than one line.
        It also consists of more than one sentence, though of course RedRug is
        not currently sentence-aware, so far as its developers are aware.</p>
      END

      expect(RedRug.to_html markdown_input).to eq html_output
    end
  end
end
