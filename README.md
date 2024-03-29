# i18n-interpolate_nested

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

Add the gem to your Gemfile:

```bash
$ bundle add i18n-interpolate_nested
```

**If you are not using Rails,** you will also need to invoke
`I18n::InterpolateNested::init` in order to hook this gem into I18n:

```ruby
require "i18n/interpolate_nested"

I18n::InterpolateNested.init
```


## Contributing

Run `bin/test` to run the tests.


## License

[MIT License](MIT-LICENSE)
