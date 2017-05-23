# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewer/adaptibrew/version'

Gem::Specification.new do |spec|
  spec.name          = "brewer-adaptibrew"
  spec.version       = Brewer::Adaptibrew::VERSION
  spec.authors       = ["Luke Sweeney"]
  spec.email         = ["luke@thesweeneys.org"]

  spec.summary       = %q{Adaptibrew manager for brewer}
  spec.homepage      = "http://github.com/llamicron/brewer-adaptibrew"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'git', '~> 1.3', '>= 1.3.0'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.14"
end
