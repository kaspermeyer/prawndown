# Prawndown
> The contents of this Readme is work in progress and might not be completely accurate.

A tiny Ruby gem to render a subset of Markdown in PDF files

Prawn is a Ruby library to generate PDF files. It supports text formatting trough its own HTML-esque language, which has tags for different formatting options like **bold**, _italic_ and [links](https://github.com/kaspermeyer/prawndown). Read more about the supported tags in the [Prawn documentation](http://prawnpdf.org/api-docs/2.0/Prawn/Text.html#text-instance_method).

## Usage
Prawndown extends Prawn with the `markdown` method. Use it to render Markdown in the document:

```ruby
Prawn::Document.generate('markdown.pdf') do
  markdown '# Welcome to Prawndown!'
  markdown '**Important:** We _hope_ you enjoy your stay!'
end
```

It accepts the same options as [`Prawn::Document#text`](http://prawnpdf.org/api-docs/2.0/Prawn/Text.html#text-instance_method)

If you prefer, you can also use the parser directly:

```ruby
Prawndown::Parser.new('_Welcome_ to **Prawndown**').to_prawn #=> '<i>Welcome</i> to <b>Prawndown</b>'
```

More thorough examples can be found under the `examples` folder. Run `rake examples` to generate the examples PDF.

*Note: Prawdown can't output the tags `<sub>`, `<sup>`, `<font>` and `<color>` as they lack native support in Markdown.*

## Installation

> The gem hasn't been published to RubyGems yet.

Add this line to your application's Gemfile:

```ruby
gem 'prawndown'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prawndown

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Credits
+ [Henrik Ny](https://github.com/henrik) for the [idea and name](https://gist.github.com/henrik/2775319) of the project.
+ [Johnny Broadway](https://github.com/jbroadway) for creating [Slimdown](https://gist.github.com/jbroadway/2836900) and coming up with great regular expressions to match Markdown tags with.
