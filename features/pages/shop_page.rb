# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'
require_relative '../support/logging_facade'

module Elopage
  class ShopPage < Elopage::MainPage
    element :default_banner_image, '#default-shop-banner-img'

    def initialize
      @logger = Support::LoggingFacade.new
    end

    def select_shop(product)
      sleep 3
      @logger.log_info(__method__, self.class.name.demodulize)
      find(:xpath, "//div[contains(text(),'#{product}')]").click
    end

    def attach_logs
      @logger.attach_logs
    end
  end
end
