# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

desc "update extjs source files"
task :update do

  $stdout.puts "Updating vendor files from ExtJS source..."
  FileUtils.rm Dir.glob('/home/niles/dev/extjs-rails/vendor/assets/javascripts/*')
  FileUtils.rm Dir.glob('/home/niles/dev/extjs-rails/vendor/assets/stylesheets/*')
  FileUtils.rm_r Dir.glob('/home/niles/dev/extjs-rails/vendor/assets/images/*')

  ['ext-all-debug.js','ext-all-dev.js','ext-all.js'].each do |file|
    FileUtils.cp "/home/niles/dev/extjs/#{file}", "/home/niles/dev/extjs-rails/vendor/assets/javascripts/"
  end

#   FileUtils.cp Dir.glob('/home/niles/dev/extjs/resources/css/*'), "/home/niles/dev/extjs-rails/vendor/assets/stylesheets/"
  Dir.glob('/home/niles/dev/extjs/resources/css/*').each do |css_file|
    FileUtils.cp css_file, "/home/niles/dev/extjs-rails/vendor/assets/stylesheets/#{File.basename( css_file )}.erb"
  end

  Dir.glob('/home/niles/dev/extjs-rails/vendor/assets/stylesheets/*').each do |css_file|
    css = File.read(css_file)
    modifed_css = css.gsub(/url\('..\/..\/resources\/themes\/images\/(.*?)'\)/,"url('<%= asset_path '\\1' %>')")
    File.open(css_file, "w") {|file| file.write(modifed_css) }
  end


  FileUtils.cp_r Dir.glob('/home/niles/dev/extjs/resources/themes/images/*'), "/home/niles/dev/extjs-rails/vendor/assets/images/"

end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "extjs-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
