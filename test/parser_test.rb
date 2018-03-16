require "test_helper"

class ParserTest < Minitest::Test
  def test_conversion_of_header_1
    markdown = '# Prawndown'
    prawn    = '<font size="26"><b>Prawndown</b></font>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_header_2
    markdown = '## Prawndown'
    prawn    = '<font size="24"><b>Prawndown</b></font>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_header_3
    markdown = '### Prawndown'
    prawn    = '<font size="22"><b>Prawndown</b></font>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_bold
    markdown = '**Prawndown**'
    prawn    = '<b>Prawndown</b>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_italic
    markdown = '*Prawndown*'
    prawn    = '<i>Prawndown</i>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_strikethrough
    markdown = '~~Prawndown~~'
    prawn    = '<strikethrough>Prawndown</strikethrough>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end

  def test_conversion_of_link
    markdown = '[Prawndown](https://github.com/kaspermeyer/prawndown)'
    prawn    = '<link href="https://github.com/kaspermeyer/prawndown">Prawndown</link>'

    assert_equal prawn, Prawndown::Parser.new(markdown).to_prawn
  end
end
