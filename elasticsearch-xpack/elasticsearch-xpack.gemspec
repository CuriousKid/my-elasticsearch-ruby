# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch/xpack/version'

Gem::Specification.new do |spec|
  spec.name          = "elasticsearch-xpack"
  spec.version       = ElasticsearchV7::XPack::VERSION
  spec.authors       = ["Karel Minarik"]
  spec.email         = ["karel@elastic.co"]

  spec.summary       = "Ruby integrations for the X-Pack extensions for ElasticsearchV7"
  spec.description   = "Ruby integrations for the X-Pack extensions for ElasticsearchV7"
  spec.homepage      = "https://github.com/elastic/elasticsearch-xpack-ruby"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "ruby-prof" unless defined?(JRUBY_VERSION) || defined?(Rubinius)

  spec.add_dependency "elasticsearch-api", '>= 6'

  spec.add_development_dependency "elasticsearch", '>= 6'
  spec.add_development_dependency "elasticsearch-transport", '>= 6'
  spec.add_development_dependency "elasticsearch-extensions"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "ansi"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "shoulda-context"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "pry"
end
