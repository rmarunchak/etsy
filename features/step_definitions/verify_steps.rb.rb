And(/^I verify Bank Wire order$/) do
  page = Elopage::BankWirePage.new
  sleep 3
  page.save_screenshot('screen.png', full: true)
  page.verify_thank_you_text
end