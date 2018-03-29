require 'prawn'
require "prawndown/version"
require "prawndown/parser"

module Prawndown
  module Interface
    # Renders Markdown in the current document
    #
    # It supports header 1-6, bold text, italic text, strikethrough and links
    # It supports the same options as +Prawn::Document#text+
    #
    #   Prawn::Document.generate('markdown.pdf') do
    #     markdown '# Welcome to Prawndown!'
    #     markdown '**Important:** We _hope_ you enjoy your stay!'
    #   end
    def markdown(string, options = {})
      text Prawndown::Parser.new(string).to_prawn, options.merge(inline_format: true)
    end
  end
end

Prawn::Document.extensions << Prawndown::Interface
