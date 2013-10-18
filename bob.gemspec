# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bob/version'

Gem::Specification.new do |spec|
  spec.name          = "bob"
  spec.version       = Bob::VERSION
  spec.authors       = ["Giorgos Avramidis"]
  spec.email         = ["avramidg@gmail.com"]
  spec.description   = %q{Bob, the Job Fetcher}
  spec.summary       = %q{Fetch Job Posting Information}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oj"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
