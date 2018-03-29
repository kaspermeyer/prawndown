
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prawndown/version"

Gem::Specification.new do |spec|
  spec.name          = "prawndown"
  spec.version       = Prawndown::VERSION
  spec.authors       = ["Kasper Meyer"]
  spec.email         = ["hi@kaspermeyer.com"]

  spec.summary       = %q{A tiny Ruby gem to render Markdown in PDF files}
  spec.homepage      = "https://github.com/kaspermeyer/prawndown"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency             "prawn",         "~> 2.0"
  spec.add_development_dependency "pdf-inspector", "~> 1.3"
  spec.add_development_dependency "simplecov",     "~> 0.16.1"
  spec.add_development_dependency "bundler",       "~> 1.16"
  spec.add_development_dependency "rake",          "~> 10.0"
  spec.add_development_dependency "minitest",      "~> 5.0"
end
