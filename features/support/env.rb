# frozen_string_literal: true

require_relative '../support/relatives'
require 'faker'
require 'capybara-screenshot/cucumber'
require 'cucumber'
require "allure-cucumber"
require 'selenium-webdriver'

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('BROWSER', 'chrome').to_sym

  options = if ENV['HEADLESS'] == 'true'
              case browser
              when :chrome
                Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
              when :firefox
                Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
              else
                nil
              end
            end

  Capybara::Selenium::Driver.new(app, browser: browser, options: options)
end

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
end

Capybara.page.driver.browser.manage.window.maximize
