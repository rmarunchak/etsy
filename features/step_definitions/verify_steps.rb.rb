# frozen_string_literal: true

And(/^I verify Bank Wire order$/) do
  sleep 3
  PageFactory.bank_wire_page.verify_thank_you_text
  PageFactory.bank_wire_page.attach_logs
end
