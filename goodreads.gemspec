# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "goodreads/version"

Gem::Specification.new do |s|
  s.name        = "goodreads"
  s.version     = Goodreads::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tiago Luchini"]
  s.email       = ["info@tiagoluchini.eu"]
  s.homepage    = "http://github.com/tiagoluchini/goodreads"
  s.summary     = %q{Easily access the publicly available information on Goodreads.}
  s.description = %q{Easily use Ruby to find information on Goodreads.com.}

  s.rubyforge_project = "goodreads"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'hpricot', '~> 0.8.4'

  s.add_development_dependency 'rake', '~> 0.9.2'
  s.add_development_dependency 'rspec', '~> 1.3.2'
  s.add_development_dependency 'gokdok'
  s.add_development_dependency 'rdoc', '~> 3.11'
  s.add_development_dependency 'fakeweb'
end
