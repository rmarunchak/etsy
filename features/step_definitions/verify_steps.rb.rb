# frozen_string_literal: true

And(/^I verify Bank Wire order$/) do
  sleep 3
  page.save_screenshot('screen.png', full: true)
  PageFactory.bank_wire_page.verify_thank_you_text
end