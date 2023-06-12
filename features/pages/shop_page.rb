# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ShopPage < Elopage::MainPage
    element :default_banner_image, '#default-shop-banner-img'

    def initialize
      @logs = []
      File.open('logfile.log', 'w').close
    end

    def select_shop(product)
      sleep 3
      log_info(__method__)
      find(:xpath, "//div[contains(text(),'#{product}')]").click
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
