# frozen_string_literal: true

And(/^I select "([^"]*)" product$/) do |product|
  PageFactory.shop_page.select_shop(product)
end

And(/^I click on checkout button$/) do
  PageFactory.product_page.tap_checkout
end

And(/^I fill in payer information and press buy button$/) do
  step_name = 'I fill in payer information and press buy button'
  PageFactory.checkout_page.put_first_name
  PageFactory.checkout_page.put_last_name
  PageFactory.checkout_page.put_email
  PageFactory.checkout_page.put_address
  PageFactory.checkout_page.put_zip
  PageFactory.checkout_page.put_city
  PageFactory.checkout_page.tap_bank_wire
  PageFactory.checkout_page.tap_buy
  PageFactory.checkout_page.attach_logs(step_name)
end
