require "test_helper"
require "i18n/interpolate_nested"

class I18n::InterpolateNested::Test < ActiveSupport::TestCase

  setup do
    I18n::InterpolateNested.init
  end

  def test_init_is_idempotent
    expected_handler = I18n.config.missing_interpolation_argument_handler
    expected_pattern = I18n::INTERPOLATION_PATTERN
    I18n::InterpolateNested.init
    assert_same expected_handler, I18n.config.missing_interpolation_argument_handler
    assert_same expected_pattern, I18n::INTERPOLATION_PATTERN
  end

  def test_init_preserves_custom_error_handler
    error = assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo}", {})
    end

    assert error.values[:customly_handled]
  end

  def test_nested_keys
    symbols = %i[foo bar baz]

    (1..symbols.length).map{|n| symbols.take(n) }.each do |keys|
      value = keys.join.bytes.join
      nested = keys.reverse.reduce(value){|v, k| { k => v } }
      assert_equal value, I18n.interpolate("%{#{keys.join(".")}}", nested)
    end
  end

  def test_missing_key
    assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo}", bar: "fail")
    end
  end

  def test_nested_nil
    nested = { foo: { bar: nil } }
    assert_equal "", I18n.interpolate("%{foo.bar}", nested)
  end

  def test_missing_nested_key
    nested = { foo: { bar: nil } }
    assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo.bar.baz}", nested)
    end
  end

  def test_nested_struct
    values = { foo: OpenStruct.new(bar: { baz: "qux" }) }
    assert_equal values[:foo][:bar][:baz], I18n.interpolate("%{foo.bar.baz}", values)
  end

  def test_translation_integration
    I18n.backend.store_translations(:en, greeting: "hello, %{name}")
    assert_equal "hello, world", I18n.t(:greeting, name: "world")
  end

end
