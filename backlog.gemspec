# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backlog/version'

Gem::Specification.new do |spec|
  spec.name          = "backlog"
  spec.version       = Backlog::VERSION
  spec.authors       = ["nakano.wax"]
  spec.email         = ["nakano.styling.wax.hard@gmail.com"]
  spec.summary       = %q{backlog command line}
  spec.description   = %q{backlog command line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6.0.pre.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor"
  # spec.add_development_dependency "xmlrpc/client"
  # spec.add_development_dependency "yaml"
end
