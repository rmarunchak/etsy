# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ProductPage < Elopage::MainPage
    element :checkout_button, :xpath, "//button[normalize-space()='Go to checkout']"

    def initialize
      @logs = []
      File.open('logfile.log', 'w').close
    end

    def tap_checkout
      log_info(__method__)
      checkout_button.click
    end

    def attach_logs
      Allure.add_attachment(
        name: 'logfile',
        source: File.read('logfile.log'),
        type: Allure::ContentType::TXT,
        test_case: false
      )
    end

    private

    def log_info(method_name)
      logger = Logger.new('logfile.log')
      log_message = "#{method_name} on #{self.class.name.demodulize}"
      logger.info(log_message)
      @logs << log_message
    end
  end
end
