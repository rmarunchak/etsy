# frozen_string_literal: true

require_relative '../support/env'
require_relative '../support/logger'
require 'logger'

module Support
  class LoggingFacade
    attr_reader :logs

    def initialize
      @logs = []
      File.open('logfile.log', 'w').close
    end

    def log_info(method_name, class_name)
      logger = Logger.new('logfile.log')
      log_message = "#{method_name} on #{class_name}"
      logger.info(log_message)
      @logs << log_message
    end

    def attach_logs
      Allure.add_attachment(
        name: 'logfile',
        source: File.read('logfile.log'),
        type: Allure::ContentType::TXT,
        test_case: false
      )
    end
  end
end