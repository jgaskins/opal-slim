# Opal-Slim

Opal-Slim is a set of Opal bindings for the Slim templating language, allowing you to use Slim templates in your Opal app. It was written to work with the [Clearwater framework](https://github.com/jgaskins/clearwater), but it should work just fine with any Opal app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opal-slim'
```

And then execute:

    $ bundle

## Usage:

Opal-Slim stores your templates in the global `Template` object, so you simply need to call `Template[template_name].render(context)`, where `context` is the object that will receive the Ruby method calls.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/opal-slim/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
