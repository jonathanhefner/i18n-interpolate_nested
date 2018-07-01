$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "i18n/interpolate_nested/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "i18n-interpolate_nested"
  s.version     = I18n::InterpolateNested::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of I18n::InterpolateNested."
  s.description = "TODO: Description of I18n::InterpolateNested."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "yard", "~> 0.9"
end
