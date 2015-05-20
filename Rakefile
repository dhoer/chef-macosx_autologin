require 'foodcritic'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = '--color -f d'
end
RuboCop::RakeTask.new(:rubocop)
FoodCritic::Rake::LintTask.new do |task|
  task.options = {
    tags: %w(~FC009) # https://github.com/acrmp/foodcritic/issues/233
  }
end

task default: [:foodcritic, :rubocop, :spec]

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
