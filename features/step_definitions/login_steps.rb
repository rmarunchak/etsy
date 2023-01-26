# frozen_string_literal: true

Given('I am on base page') do
  PageFactory.home_page.open_homepage
  PageFactory.home_page.allow_cookies
end

And(/^I login as a seller$/) do
  PageFactory.home_page.tap_login
  PageFactory.sign_in_page.set_email
  PageFactory.sign_in_page.set_password
  PageFactory.sign_in_page.tap_sign_in
end

And(/^I login as a payer$/) do
  visit('https://staging.elopage.com/payer')
end

And(/^I visit "([^"]*)" shop$/) do |shop_name|
  visit("https://staging.elopage.com/s/#{shop_name}")
  page.save_screenshot('screen.png', full: true)
end