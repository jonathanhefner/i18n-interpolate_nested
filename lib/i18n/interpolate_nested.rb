require "i18n"
require "i18n/interpolate_nested/version"
require "i18n/interpolate_nested/railtie" if defined?(Rails)


module I18n::InterpolateNested

  # Hooks into I18n and enables nested values when interpolating.  This
  # method is idempotent.
  #
  # @return [void]
  def self.init
    return if defined?(@@initialized)

    original_handler = I18n.config.missing_interpolation_argument_handler
    I18n.config.missing_interpolation_argument_handler = ->(key, values, string) do
      keys = key.to_s.split(".")

      if keys.length > 1
        keys.reduce(values) do |vs, k|
          break original_handler.call(key, values, string) if vs.nil?
          vs[k.to_sym]
        end
      else
        original_handler.call(key, values, string)
      end
    end

    I18n.config.interpolation_patterns << /%\{([\w.]+)\}/

    @@initialized = true
  end

end
