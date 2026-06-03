require "test_helper"
require "i18n/interpolate_nested"
require "ostruct"

class I18n::InterpolateNested::Test < ActiveSupport::TestCase

  test "init is idempotent" do
    expected_handler = I18n.config.missing_interpolation_argument_handler
    expected_patterns = I18n.config.interpolation_patterns.dup
    I18n::InterpolateNested.init
    assert_same expected_handler, I18n.config.missing_interpolation_argument_handler
    assert_equal expected_patterns, I18n.config.interpolation_patterns
  end

  test "init preserves custom missing interpolation handler" do
    error = assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo}", {})
    end

    assert error.values[:customly_handled]
  end

  test "interpolation supports nested keys" do
    symbols = %i[foo bar baz]

    (1..symbols.length).map{|n| symbols.take(n) }.each do |keys|
      value = keys.join.bytes.join
      nested = keys.reverse.reduce(value){|v, k| { k => v } }
      assert_equal value, I18n.interpolate("%{#{keys.join(".")}}", nested)
    end
  end

  test "missing interpolation key uses original error handler" do
    assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo}", bar: "fail")
    end
  end

  test "nested nil value interpolates as an empty string" do
    nested = { foo: { bar: nil } }
    assert_equal "", I18n.interpolate("%{foo.bar}", nested)
  end

  test "missing nested interpolation key uses original error handler" do
    nested = { foo: { bar: nil } }
    assert_raise I18n::MissingInterpolationArgument do
      I18n.interpolate("%{foo.bar.baz}", nested)
    end
  end

  test "nested interpolation reads values through #[]" do
    values = { foo: OpenStruct.new(bar: { baz: "qux" }) }
    assert_equal values[:foo][:bar][:baz], I18n.interpolate("%{foo.bar.baz}", values)
  end

  test "integration with I18n.t" do
    I18n.backend.store_translations(:en, greeting: "hello, %{name}")
    assert_equal "hello, world", I18n.t(:greeting, name: "world")
  end

end
