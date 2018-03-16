module Prawndown
  class Parser
    MATCHERS = {
      /^# (.+)/                  => '<font size="26"><b>\1</b></font>', # Header 1
      /^## (.+)/                 => '<font size="24"><b>\1</b></font>', # Header 2
      /^### (.+)/                => '<font size="22"><b>\1</b></font>', # Header 3
      /\[([^\[]+)\]\(([^\)]+)\)/ => '<link href="\2">\1</link>',        # Link
      /(\*\*|__)(.*?)\1/         => '<b>\2</b>',                        # Bold
      /(\*|_)(.*?)\1/            => '<i>\2</i>',                        # Italic
      /\~\~(.*?)\~\~/            => '<strikethrough>\1</strikethrough>' # Strikethrough
    }

    def initialize(text)
      @text = text.to_s
    end

    def to_prawn
      MATCHERS.inject(@text) do |final_string, (markdown_matcher, prawn_tag)|
        final_string.gsub(markdown_matcher, prawn_tag)
      end
    end
  end
end
