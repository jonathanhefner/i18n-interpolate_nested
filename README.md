# i18n-interpolate_nested [![Build Status](https://travis-ci.org/jonathanhefner/i18n-interpolate_nested.svg?branch=master)](https://travis-ci.org/jonathanhefner/i18n-interpolate_nested)

Enables nested values when using I18n interpolation:

```yaml
# config/locales/en.yml
en:
  greeting: "Hello, %{user.name}!"
```

```ruby
user = OpenStruct.new(name: "Matz")
I18n.t(:greeting, user: user) # == "Hello, Matz!"
```

Interpolation keys are split into individual symbols (e.g. `:user`
and `:name` in the above example), and passed to the `#[]` method of
each nesting object.  Thus, interpolation works with nested Hashes,
Structs, OpenStructs, Active Record objects, etc.


## Installation

Add this line to your application's Gemfile:

```ruby
gem "i18n-interpolate_nested"
```

And then execute:

```bash
$ bundle install
```

**If you are not using Rails,** you will also need to invoke
`I18n::InterpolateNested::init` in order to hook this gem into I18n:

```ruby
require "i18n/interpolate_nested"

I18n::InterpolateNested.init
```


## Contributing

Run `rake test` to run the tests.


## License

[MIT License](https://opensource.org/licenses/MIT)
