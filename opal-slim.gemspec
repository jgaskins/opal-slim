# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opal/slim/version'

Gem::Specification.new do |spec|
  spec.name          = "opal-slim"
  spec.version       = Opal::Slim::VERSION
  spec.authors       = ["Jamie Gaskins"]
  spec.email         = ["jgaskins@gmail.com"]
  spec.summary       = %q{Write your Opal app's templates in Slim}
  spec.description   = %q{Wrapper around the slim gem to let you write slim templates for your Opal app}
  spec.homepage      = "https://github.com/jgaskins/opal-slim"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'slim', '~> 2.1'
  spec.add_dependency 'sprockets', '>= 2.12.1', '< 4.0.0'
  spec.add_dependency 'opal'
end
