# frozen_string_literal: true
#
require_relative '../support/decorator'

Given('I am on base page') do
  @home_page = Support::Decorator.new(Elopage::HomePage)
  @home_page.call_with_log(:open_homepage)
  @home_page.call_with_log(:allow_cookies)
end

And(/^I login as a seller$/) do
  sign_in_page = Decorator.new(PageFactory.sign_in_page)
  sign_in_page.set_email
  sign_in_page.set_password
  sign_in_page.tap_sign_in
end

And(/^I login as a payer$/) do
  visit('https://staging.elopage.com/payer')
end

And(/^I visit "([^"]*)" shop$/) do |shop_name|
  visit("https://staging.elopage.com/s/#{shop_name}")
  page.save_screenshot('screen.png', full: true)
end