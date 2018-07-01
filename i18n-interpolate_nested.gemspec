$:.push File.expand_path("lib", __dir__)

require "i18n/interpolate_nested/version"

Gem::Specification.new do |s|
  s.name        = "i18n-interpolate_nested"
  s.version     = I18n::InterpolateNested::VERSION
  s.authors     = ["Jonathan Hefner"]
  s.email       = ["jonathan.hefner@gmail.com"]
  s.homepage    = "https://github.com/jonathanhefner/i18n-interpolate_nested"
  s.summary     = %q{I18n interpolation support for nested values}
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "i18n", "~> 1.0"

  s.add_development_dependency "rails", ">= 5.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "yard", "~> 0.9"
end
