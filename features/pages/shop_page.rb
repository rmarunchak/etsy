# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ShopPage < Elopage::MainPage
    element :default_banner_image, '#default-shop-banner-img'

    def select_shop(product)
      sleep 3
      # wait_until_default_banner_image_visible
      find(:xpath, "//div[contains(text(),'#{product}')]").click
    end

  end
end
