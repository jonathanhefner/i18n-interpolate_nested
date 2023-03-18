require_relative "lib/i18n/interpolate_nested/version"

Gem::Specification.new do |spec|
  spec.name        = "i18n-interpolate_nested"
  spec.version     = I18n::InterpolateNested::VERSION
  spec.authors     = ["Jonathan Hefner"]
  spec.email       = ["jonathan@hefner.pro"]
  spec.homepage    = "https://github.com/jonathanhefner/i18n-interpolate_nested"
  spec.summary     = %q{I18n interpolation support for nested values}
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.metadata["source_code_uri"] + "/blob/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "i18n", "~> 1.2"
end
