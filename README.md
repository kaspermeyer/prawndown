# Prawndown
> The contents of this Readme is work in progress and might not be completely accurate.

Prawn is a Ruby library to genere PDF files. It supports text formatting trough its own tiny HTML-esque language, which has tags for different formatting options like **bold**, _italic_ and [links](https://github.com/kaspermeyer/prawndown). Read more about the supported tags [in the official Prawn documentation](http://prawnpdf.org/api-docs/2.0/Prawn/Text.html#text-instance_method).

Prawndown converts a small subset of Markdown to a Prawn-compatible string.

## Usage

```ruby
Prawndown.new('_Welcome_ to **Prawndown**').to_prawn #=> '<i>Welcome</i> to <b>Prawndown</b>'
```

More thorough examples can be found under the `examples` folder. Run `rake examples` to generate the examples PDF.

*Note: Prawdown can't output the tags `<sub>`, `<sup>` and `<color>` as they lack native support in Markdown.*

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
