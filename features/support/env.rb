require_relative '../support/relatives'

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('BROWSER', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser)
end

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
end
