# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adhearsion-asr-ndev/version"

Gem::Specification.new do |s|
  s.name        = "adhearsion-asr-ndev"
  s.version     = AdhearsionASRNdev::VERSION
  s.authors     = ["Ben Klang"]
  s.email       = ["bklang@mojolingo.com"]
  s.homepage    = "https://github.com/adhearsion/adhearsion-asr-ndev"
  s.summary     = %q{Adds speech recognition support via Nuance NDEV to Adhearsion as a plugin}
  s.description = %q{Adds speech recognition support via Nuance NDEV to Adhearsion as a plugin}
  
  s.license = 'MIT'

  s.rubyforge_project = "adhearsion-asr-ndev"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency %q<adhearsion-asr>, ["~> 1.1"]
  s.add_runtime_dependency %q<httpclient>, ["~> 2.3" ]
  s.add_runtime_dependency %q<adhearsion>, ["~> 2.4"]
  s.add_runtime_dependency %q<punchblock>, ["~> 2.0"]
  s.add_runtime_dependency %q<ruby_speech>, ["~> 2.1"]

  s.add_development_dependency %q<bundler>, ["~> 1.0"]
  s.add_development_dependency %q<rspec>, ["~> 2.5"]
  s.add_development_dependency %q<rake>, [">= 0"]
  s.add_development_dependency %q<guard-rspec>
  s.add_development_dependency %q<rb-fsevent>, ['~> 0.9']
 end
