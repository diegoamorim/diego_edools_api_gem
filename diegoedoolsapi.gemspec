# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "diegoedoolsapi/version"

Gem::Specification.new do |spec|
  spec.name          = "diegoedoolsapi"
  spec.version       = Diegoedoolsapi::VERSION
  spec.authors       = ["diegoamorim"]
  spec.email         = ["diego@edools.com"]

  spec.summary       = %q{Request Edools API.}
  spec.description   = %q{Gem to make requests on Edools API.}
  spec.homepage      = "https://github.com/diegoamorim/diego_edools_api_gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "0.11.0"

  spec.add_dependency "httparty", "0.13.1"
end
