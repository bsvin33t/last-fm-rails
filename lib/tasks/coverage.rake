require 'rspec/core/rake_task'
require 'simplecov'

namespace :coverage do
  desc 'General Coverage'
  task :all do
    ENV['COVERAGE'] = 'true'
    Rake::Task['default'].invoke
  end
end