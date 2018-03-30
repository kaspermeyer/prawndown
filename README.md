# Prawndown

[![Build Status](https://travis-ci.org/kaspermeyer/prawndown.svg?branch=master)](https://travis-ci.org/kaspermeyer/prawndown)
[![Coverage Status](https://coveralls.io/repos/github/kaspermeyer/prawndown/badge.svg?branch=master)](https://coveralls.io/github/kaspermeyer/prawndown?branch=master)
[![Read the Docs (version)](http://img.shields.io/badge/docs-%E2%9C%93-green.svg)](http://www.rubydoc.info/gems/prawndown)
[![Gem](https://img.shields.io/gem/v/prawndown.svg)](https://rubygems.org/gems/prawndown)

A tiny Ruby gem to render a subset of Markdown in PDF files.

Prawn is a Ruby library to generate PDF files. It supports text formatting trough its own HTML-esque language, which has tags for different formatting options like **bold**, _italic_, ~~strikethrough~~ and [links](https://github.com/kaspermeyer/prawndown). Read more about the supported tags in the [Prawn documentation](http://prawnpdf.org/api-docs/2.0/Prawn/Text.html#text-instance_method).

## Usage

Prawndown extends Prawn with the `markdown` method. It accepts the same options as [`Prawn::Document#text`](http://prawnpdf.org/api-docs/2.0/Prawn/Text.html#text-instance_method).

Use it to render Markdown in the document:

```ruby
Prawn::Document.generate('markdown.pdf') do
  markdown '# Welcome to Prawndown!'
  markdown '**Important:** We _hope_ you enjoy your stay!', color: 'aaaaaa', leading: 10
end
```

If prefered, the parser can also be invoked directly:

```ruby
Prawndown::Parser.new('_Welcome_ to **Prawndown**').to_prawn #=> '<i>Welcome</i> to <b>Prawndown</b>'
```

More thorough examples can be found under the `examples` folder. Run `rake examples` to generate the examples PDF.

### Supported Markdown syntax
```markdown
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6
_Italic_
*Italic*
__Bold__
**Bold**
~~Strikethrough~~
[Links](https://github.com/kaspermeyer/prawndown)
```

*Note: Prawdown can't output the tags `<sub>`, `<sup>`, `<font>` and `<color>` as they lack native support in Markdown.*

## Installation

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
