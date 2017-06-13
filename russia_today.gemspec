# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'russia_today/version'

Gem::Specification.new do |spec|
  spec.name          = 'russia_today'
  spec.version       = RussiaToday::VERSION
  spec.authors       = ['Aleksey Ivanov']
  spec.email         = ['ialexxei@gmail.com']

  spec.summary       = 'Holidays according to official calendar.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/ivanovaleksey/russia_today'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
