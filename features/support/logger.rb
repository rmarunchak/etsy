# frozen_string_literal: true

require_relative '../support/env'
require 'logger'

module Support
  class Logs
    def initialize(logger)
      @logger = logger
    end

    def log_info(method_name, class_name)
      logger = Logger.new(STDOUT)
      log_message = "#{method_name} on #{class_name.class.name.demodulize}"
      logger.info(log_message)

      # Add log to Allure report
      Allure.add_attachment(
        name: "Log info",
        source: log_message,
        type: Allure::ContentType::TXT,
        test_case: true
      )
      log_message
    end
  end
end

