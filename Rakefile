require "bundler/gem_tasks"
begin
  require 'cucumber'
  require 'cucumber/rake/task'
rescue LoadError
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => [:features]
