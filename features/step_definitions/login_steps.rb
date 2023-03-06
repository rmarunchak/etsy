# frozen_string_literal: true
#
require_relative '../support/decorator'

Given('I am on base page') do
  home_page = Support::Decorator.new(PageFactory.home_page)
  home_page.open_homepage
  home_page.allow_cookies
  home_page.tap_login
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