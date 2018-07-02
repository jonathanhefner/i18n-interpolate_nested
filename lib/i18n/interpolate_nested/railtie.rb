module I18n
  module InterpolateNested
    # @!visibility private
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        I18n::InterpolateNested.init
      end
    end
  end
end
