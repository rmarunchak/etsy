require 'capybara'
require 'capybara/cucumber'
require 'capybara/selenium/driver'
require 'site_prism'
require_relative '../pages/home_page'

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'firefox').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser, desired_capabilities: capabilities)
end

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
end
