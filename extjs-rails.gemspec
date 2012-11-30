# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "extjs/rails/version"

Gem::Specification.new do |s|
  s.name = "extjs-rails"
  s.version = ExtJS::Rails::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Sean Kellogg"]
  s.email = ["skellogg@probonogeek.org"]
  s.homepage = "http://github.com/probonogeek/extjs-rails"
  s.summary = %q{Sencha ExtJS JavaScript Framework for Rails 3.1 Asset Pipeline.}
  s.description = %q{extjs-rails project integrates Sencha ExtJS for Rails 3.1 Asset Pipeline.}
  s.license = "GPL"

  s.rubyforge_project = "extjs-rails"

  s.add_dependency "railties", ">= 3.1"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end