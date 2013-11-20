require "bundler/gem_tasks"
require "rake/testtask"
$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec


Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/tc*.rb']
  t.verbose = true
end
