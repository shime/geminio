# coding: utf-8
require "./lib/geminio/version"

Gem::Specification.new do |spec|
  spec.name          = "geminio"
  spec.version       = Geminio::VERSION
  spec.authors       = ["Hrvoje Šimić"]
  spec.email         = ["shime.ferovac@gmail.com"]
  spec.summary       = %q{Micro utility that sets up the stage for building gems.}
  spec.description   = %q{Micro utility that sets up the stage for building gems.}
  spec.homepage      = "https://github.com/shime/geminio"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.19', '>= 0.19.1'
  spec.add_runtime_dependency 'user-configurations', '~> 0.1', '>= 0.1.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency "aruba", "~> 0.6", ">= 0.6.2"
  spec.add_development_dependency "cucumber", "~> 1.3", ">= 1.3.18"
  spec.add_development_dependency "pry", "~> 0.10", ">= 0.10.1"
end
