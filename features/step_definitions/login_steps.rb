# frozen_string_literal: true
#
require_relative '../support/decorator'

Given('I am on base page') do
  @home_page = Support::Decorator.new(Elopage::HomePage)
  @home_page.call_with_log(:open_homepage)
  @home_page.call_with_log(:allow_cookies)
  @home_page.call_with_log(:tap_login)
end

And(/^I login as a seller$/) do
  @sign_in_page = Support::Decorator.new(Elopage::MainPage)
  @sign_in_page.call_with_log(:set_email)
  @sign_in_page.call_with_log(:set_password)
  @sign_in_page.call_with_log(:tap_sign_in)
end

And(/^I visit "([^"]*)" shop$/) do |shop_name|
  visit("https://staging.elopage.com/s/#{shop_name}")
  page.save_screenshot('screen.png', full: true)
end