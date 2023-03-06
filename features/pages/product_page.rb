# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ProductPage < Elopage::MainPage
    element :checkout_button, :xpath, "//button[normalize-space()='Go to checkout']"

    def tap_checkout
      log = Logger.new(STDOUT)
      log.info("#{__method__} on #{self.class.name.gsub('Elopage::', '')}")
      checkout_button.click
    end

  end
end
