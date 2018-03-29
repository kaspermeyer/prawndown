require 'prawndown'

def sample_text
  <<-HEREDOC
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6

It is __really__ **really** important that you _use_ this gem for something ~~useful~~ fun!
Visit the [Prawndown documentation](https://github.com/kaspermeyer/prawndown) *now*!

Remember that it also supports paragraphs.




It respects the number of new lines.
  HEREDOC
end

Prawn::Document.generate('markdown.pdf') do
  markdown sample_text
end
