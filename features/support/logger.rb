# frozen_string_literal: true

require_relative '../support/env'

module Support
  class Logger
    def log_info(method_name, class_name)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end

