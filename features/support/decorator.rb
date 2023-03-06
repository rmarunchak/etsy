# frozen_string_literal: true
require_relative '../support/env'
require_relative '../support/logger'

module Support
  class Decorator < Support::Logger
    def initialize(component)
      @component = component
    end

    def log_info(method_name, class_name)
      log = Logger.new(STDOUT)
      log.info("#{method_name} on #{class_name}")
    end

    def open_homepage
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.open_homepage
    end

    def tap_login
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.tap_login
    end

    def allow_cookies
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.allow_cookies
    end

    def set_email
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.set_email
    end

    def set_password
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.set_password
    end

    def tap_sign_in
      log_info(__method__, @component.class.name.gsub('Elopage::', ''))
      @component.tap_sign_in
    end
  end
end