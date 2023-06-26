# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class BankWirePage < Elopage::MainPage
    element :thank_you_text_label, :xpath, "//div[contains(text(),'Thank you for your order')]"

    def initialize
      @logs = []
      File.open('logfile.log', 'w').close
      @notifier = Support::Notifier.new
      @notifier.add_observer(Support::LoggerObserver.new)
      @notifier.add_observer(Support::AllureObserver.new)
    end

    def verify_thank_you_text
      wait_until_thank_you_text_label_visible
      @notifier.notify_observers('Test failed: Thank you text not found') unless page.has_thank_you_text_label?
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
