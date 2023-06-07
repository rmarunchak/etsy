require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)

namespace :test do
  desc 'Run tests in Chrome'
  task :chrome do
    sh 'bundle install'
    ENV['BROWSER'] = 'chrome'
    begin
      Rake::Task["cucumber"].execute
    rescue RuntimeError => e
      puts "Tests failed in Chrome: #{e.message}"
    ensure
      Rake::Task["cucumber"].reenable  # Allow the cucumber task to be executed again
    end
  end

  desc 'Run tests in Firefox'
  task :firefox do
    sh 'bundle install'
    ENV['BROWSER'] = 'firefox'
    begin
      Rake::Task["cucumber"].execute
    rescue RuntimeError => e
      puts "Tests failed in Firefox: #{e.message}"
    ensure
      Rake::Task["cucumber"].reenable  # Allow the cucumber task to be executed again
    end
  end

  desc 'Run tests in Safari'
  task :safari do
    sh 'bundle install'
    ENV['BROWSER'] = 'safari'
    begin
      Rake::Task["cucumber"].execute
    rescue RuntimeError => e
      puts "Tests failed in Safari: #{e.message}"
    ensure
      Rake::Task["cucumber"].reenable  # Allow the cucumber task to be executed again
    end
  end

  desc 'Run tests in headless mode'
  task :headless do
    sh 'bundle install'
    ENV['HEADLESS'] = 'true'
    Rake::Task["cucumber"].execute
    Rake::Task["cucumber"].reenable  # Allow the cucumber task to be executed again
  end

  desc 'Run tests in cross-browser mode'
  task :cross_browser => [:chrome, :firefox, :safari]
end
