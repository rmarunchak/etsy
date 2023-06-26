# frozen_string_literal: true
#
require_relative '../support/decorator'

Given('I am on base page') do
  PageFactory.home_page.open_homepage
  PageFactory.home_page.allow_cookies
  PageFactory.home_page.tap_login
  PageFactory.home_page.attach_logs
end


And(/^I login as a seller using decorator$/) do
  @sign_in_page = Support::Decorator.new(Elopage::MainPage)
  @sign_in_page.call_with_log(:set_email)
  @sign_in_page.call_with_log(:set_password)
  @sign_in_page.call_with_log(:tap_sign_in)
end

And(/^I login as a seller$/) do
  PageFactory.sign_in_page.set_email
  PageFactory.sign_in_page.set_password
  PageFactory.signin_page.tap_sign_in
end

And(/^I open profile$/) do
  PageFactory.dashboard_page.tap_profile_menu
  PageFactory.dashboard_page.tap_profile
end

And(/^I visit "([^"]*)" shop$/) do |shop_name|
  url = "https://staging.elopage.com/s/#{shop_name}"
  logger = Logger.new('logfile.log')
  File.open('logfile.log', 'w').close
  logger.info("User redirects to #{url}")
  visit(url)

  Allure.add_attachment(
    name: 'logfile',
    source: File.read('logfile.log'),
    type: Allure::ContentType::TXT,
    test_case: false
  )
end
