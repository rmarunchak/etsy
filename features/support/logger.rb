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
      logger.info("#{method_name} on #{class_name.class.name.demodulize}")
    end
  end
end

