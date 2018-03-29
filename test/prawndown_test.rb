require "test_helper"

class PrawndownTest < Minitest::Test
  def setup
    @pdf = Prawn::Document.new
    @pdf.font 'Helvetica'
  end

  def analyze_strings
    PDF::Inspector::Text.analyze(@pdf.render).strings
  end

  def analyze_font_name
    PDF::Inspector::Text.analyze(@pdf.render).font_settings[0][:name].to_s
  end

  def analyze_font_size
    PDF::Inspector::Text.analyze(@pdf.render).font_settings[0][:size]
  end

  def analyze_points
    PDF::Inspector::Graphics::Line.analyze(@pdf.render).points
  end

  def test_header_1_is_rendered_to_the_pdf
    @pdf.markdown '# Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_1_uses_the_correct_font_size
    @pdf.markdown '# Prawndown'

    assert_equal 26, analyze_font_size
  end

  def test_header_2_is_rendered_to_the_pdf
    @pdf.markdown '## Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_2_uses_the_correct_font_size
    @pdf.markdown '## Prawndown'

    assert_equal 24, analyze_font_size
  end

  def test_header_3_is_rendered_to_the_pdf
    @pdf.markdown '### Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_3_uses_the_correct_font_size
    @pdf.markdown '### Prawndown'

    assert_equal 22, analyze_font_size
  end

  def test_header_4_is_rendered_to_the_pdf
    @pdf.markdown '#### Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_4_uses_the_correct_font_size
    @pdf.markdown '#### Prawndown'

    assert_equal 20, analyze_font_size
  end

  def test_header_5_is_rendered_to_the_pdf
    @pdf.markdown '##### Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_5_uses_the_correct_font_size
    @pdf.markdown '##### Prawndown'

    assert_equal 18, analyze_font_size
  end

  def test_header_6_is_rendered_to_the_pdf
    @pdf.markdown '###### Prawndown'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_header_6_uses_the_correct_font_size
    @pdf.markdown '###### Prawndown'

    assert_equal 16, analyze_font_size
  end

  def test_bold_text_is_rendered_to_the_pdf
    @pdf.markdown '**Prawndown**'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_bold_text_uses_the_correct_font_weight
    @pdf.markdown '**Prawndown**'

    assert_equal 'Helvetica-Bold', analyze_font_name
  end

  def test_bold_text_with_alternative_syntax_is_rendered_to_the_pdf
    @pdf.markdown '__Prawndown__'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_bold_text_with_alternative_syntax_uses_the_correct_font_weight
    @pdf.markdown '__Prawndown__'

    assert_equal 'Helvetica-Bold', analyze_font_name
  end

  def test_italic_text_is_rendered_to_the_pdf
    @pdf.markdown '*Prawndown*'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_italic_text_uses_the_correct_font_style
    @pdf.markdown '*Prawndown*'

    assert_equal 'Helvetica-Oblique', analyze_font_name
  end

  def test_italic_text_with_alternative_syntax_is_rendered_to_the_pdf
    @pdf.markdown '_Prawndown_'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_italic_text_with_alternative_syntax_uses_the_correct_font_style
    @pdf.markdown '_Prawndown_'

    assert_equal 'Helvetica-Oblique', analyze_font_name
  end

  def test_strikethrough_text_is_rendered_to_the_pdf
    @pdf.markdown '~~Prawndown~~'

    assert_includes analyze_strings, 'Prawndown'
  end

  def test_strikethrough_is_rendered_as_a_line_in_the_pdf
    @pdf.markdown '~~Prawndown~~'

    refute_empty analyze_points
  end

  def test_link_is_rendered_to_the_pdf
    @pdf.markdown '[Prawndown](https://github.com/kaspermeyer/prawndown)'

    assert_includes analyze_strings, 'Prawndown'
  end
end
