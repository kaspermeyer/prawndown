module Prawndown
  # Markdown to Prawn parser
  class Parser
    MATCHERS = {
      /^# (.+)/                  => '<font size="26"><b>\1</b></font>', # Header 1
      /^## (.+)/                 => '<font size="24"><b>\1</b></font>', # Header 2
      /^### (.+)/                => '<font size="22"><b>\1</b></font>', # Header 3
      /^#### (.+)/               => '<font size="20"><b>\1</b></font>', # Header 4
      /^##### (.+)/              => '<font size="18"><b>\1</b></font>', # Header 5
      /^###### (.+)/             => '<font size="16"><b>\1</b></font>', # Header 6
      /\[([^\[]+)\]\(([^\)]+)\)/ => '<link href="\2">\1</link>',        # Link
      /(\*\*|__)(.*?)\1/         => '<b>\2</b>',                        # Bold
      /(\*|_)(.*?)\1/            => '<i>\2</i>',                        # Italic
      /\~\~(.*?)\~\~/            => '<strikethrough>\1</strikethrough>' # Strikethrough
    }

    # Initialize a new +Prawndown::Parser+.
    # +text+ must a a valid Markdown string that only contains supported tags.
    #
    # Supported tags are: Header 1-6, bold, italic, strikethrough and link.
    def initialize(text)
      @text = text.to_s
    end

    # Parses the Markdown text and outputs a Prawn compatible string
    def to_prawn
      MATCHERS.inject(@text) do |final_string, (markdown_matcher, prawn_tag)|
        final_string.gsub(markdown_matcher, prawn_tag)
      end
    end
  end
end
