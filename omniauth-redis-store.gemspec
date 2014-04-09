# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-redis-store/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.authors       = ['Paul Scarrone']
  spec.description   = %Q(An adapter for using Redis like a session keystore during requests compatible with #{OmniAuthRedisStore::OMNIAUTH_COMPAT})
  spec.email         = ['paul.scarrone@gmail.com']
  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.homepage      = 'http://github.com/ninjapanzer/omniauth-redis-store'
  spec.licenses      = %w(MIT)
  spec.name          = 'omniauth-redis-store'
  spec.require_paths = %w(lib)
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary       = spec.description
  spec.version       = OmniAuthRedisStore::VERSION
end
