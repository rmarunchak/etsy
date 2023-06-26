require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)

def run_tests_with_strategy(strategy)
  sh 'bundle install'
  strategy.call
  begin
    Rake::Task["cucumber"].execute
  rescue RuntimeError => e
    puts "Tests failed: #{e.message}"
  ensure
    Rake::Task["cucumber"].reenable
  end
end

namespace :test do
  desc 'Run tests in Chrome'
  task :chrome do
    run_tests_with_strategy -> { ENV['BROWSER'] = 'chrome' }
  end

  desc 'Run tests in Firefox'
  task :firefox do
    run_tests_with_strategy -> { ENV['BROWSER'] = 'firefox' }
  end

  desc 'Run tests in Safari'
  task :safari do
    run_tests_with_strategy -> { ENV['BROWSER'] = 'safari' }
  end

  desc 'Run tests in headless mode'
  task :headless do
    run_tests_with_strategy -> { ENV['HEADLESS'] = 'true' }
  end

  desc 'Run tests in cross-browser mode'
  task :cross_browser => [:chrome, :firefox, :safari]
end
