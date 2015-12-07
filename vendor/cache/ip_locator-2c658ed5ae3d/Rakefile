# require "bundler/gem_tasks"
# require "rake/testtask"
#
# Rake::TestTask.new(:test) do |t|
#   t.libs << "test"
#   t.libs << "lib"
#   t.test_files = FileList['test/**/*_test.rb']
# end
#
# task :default => :test

require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'nested']
end

task :default => :spec
