# frozen_string_literal: true

Given('I am on base page') do
  Elopage::HomePage.new.open_homepage
  Elopage::HomePage.new.allow_cookies
  log = Logger.new(STDOUT)
  log.info('Base page successfully opened')
end

And(/^I login as a seller$/) do
  sign_in_page = Elopage::SigninPage.new
  Elopage::HomePage.new.tap_login
  sign_in_page.set_email
  sign_in_page.set_password
  sign_in_page.tap_sign_in
end

And(/^I login as a payer$/) do
  visit('https://staging.elopage.com/payer')
end

And(/^I visit "([^"]*)" shop$/) do |shop_name|
  visit("https://staging.elopage.com/s/#{shop_name}")
end

And(/^I open profile page$/) do
  page = Elopage::DashboardPage.new
  page.tap_profile_menu
  page.tap_profile
end

And(/^I change image$/) do
  page = Elopage::ProfilePage.new
  page.tap_edit
  page.image_upload
end

And(/^I select "([^"]*)" product$/) do |product|
  page = Elopage::ShopPage.new
  page.select_shop(product)
end