# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multiple_files_gzip_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "multiple_files_gzip_reader"
  spec.version       = MultipleFilesGzipReader::VERSION
  spec.authors       = ["Evgeny Li"]
  spec.email         = ["exaspark@gmail.com"]

  spec.summary       = %q{GzipReader for reading multiple files}
  spec.description   = %q{GzipReader for reading multiple files}
  spec.homepage      = "https://github.com/exAspArk/multiple_files_gzip_reader"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6"
  spec.add_development_dependency "pry-byebug", "~> 2.0"
end
