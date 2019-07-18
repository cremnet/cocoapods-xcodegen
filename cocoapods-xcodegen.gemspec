# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-xcodegen/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-xcodegen'
  spec.version       = CocoapodsXcodegen::VERSION
  spec.authors       = ['Roman Golofaev']
  spec.email         = ['cremnet@bk.ru']
  spec.description   = %q{Plugin for Xcode project generation}
  spec.summary       = %q{Plugin for Xcode project generation}
  spec.homepage      = 'https://github.com/cremnet/cocoapods-xcodegen.git'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
