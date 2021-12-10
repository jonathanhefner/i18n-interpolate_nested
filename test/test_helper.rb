# Configure I18n with slightly-custom interpolation error handler
require "i18n"
I18n.config.tap do |config|
  original_handler = config.missing_interpolation_argument_handler
  config.missing_interpolation_argument_handler = ->(key, values, string) do
    original_handler.call(key, values.merge(customly_handled: true), string)
  end
end

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"

ActiveSupport::TestCase.fixtures :all
