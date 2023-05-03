# frozen_string_literal: true

require_relative '../support/relatives'
require 'faker'
require 'capybara-screenshot/cucumber'
require 'cucumber'
require "allure-cucumber"



Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('BROWSER', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser)
end

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
end

Capybara.page.driver.browser.manage.window.maximize