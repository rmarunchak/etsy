# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ProductPage < Elopage::MainPage
    element :checkout_button, :xpath, "//button[normalize-space()='Go to checkout']"

    def tap_checkout
      checkout_button.click
    end

  end
end
