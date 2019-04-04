# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whence/version"

Gem::Specification.new do |spec|
  spec.name          = "whence"
  spec.version       = Whence::VERSION
  spec.authors       = ["Caleb Thompson"]
  spec.email         = ["caleb@calebthompson.io"]

  spec.summary       = "Track down object allocations"
  spec.description   = "Ask each allocation, does this spark joy? If not, thank it and throw it away."
  spec.homepage      = "https://www.calebthompson.io"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
