Given('I am on base page') do
  @page = Etsy::HomePage.new.open_homepage
end

And(/^I sign in as a registered user$/) do
  @page.sign_in
end