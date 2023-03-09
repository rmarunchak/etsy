# frozen_string_literal: true
require_relative '../support/env'
require_relative '../support/logger'
require 'logger'

module Support
  class Decorator < Logs
    def initialize(class_name)
      @class_name = class_name
      @class_instance = class_name.new
    end


    def call_with_log(method_name)
      log_info(method_name, @class_instance)
      @class_instance.send(method_name.to_sym)
    end
  end
end