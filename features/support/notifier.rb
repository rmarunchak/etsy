# frozen_string_literal: true
require_relative '../support/env'
require_relative '../support/logger'
require 'logger'

module Support
  class Notifier
    def initialize
      @observers = []
    end

    def add_observer(observer)
      @observers << observer
    end

    def notify_observers(message)
      @observers.each do |observer|
        observer.notify(message)
      end
    end
  end

  class LoggerObserver
    def notify(message)
      # Log the message
      puts "Logging: #{message}"
    end
  end

  class AllureObserver
    def notify(message)
      # Add the message to the Allure report
      Allure.add_attachment(
        name: "Test failure",
        source: message,
        type: Allure::ContentType::TXT,
        test_case: true
      )
    end
  end

end