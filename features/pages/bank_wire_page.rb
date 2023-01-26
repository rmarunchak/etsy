# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class BankWirePage < Elopage::MainPage
    element :thank_you_text_label, :xpath, "//div[contains(text(),'Thank you for your order')]"

    def verify_thank_you_text
      wait_until_thank_you_text_label_visible
      page.has_thank_you_text_label?
    end

  end
end
