require 'prawn'
require "prawndown/version"
require "prawndown/parser"

module Prawndown
  module Interface
    def markdown(string, options = {})
      text Prawndown::Parser.new(string).to_prawn, options.merge(inline_format: true)
    end
  end
end

Prawn::Document.extensions << Prawndown::Interface
