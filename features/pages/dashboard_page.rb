# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class DashboardPage < Elopage::MainPage
    element :profile_button, '#profile-settings-menu'
    element :profile_link, :xpath, "//*[contains(text(),'Profile')]"

    def tap_profile_menu
      sleep 3
      #      wait_until_profile_button_visible
      profile_button.click
    end

    def tap_profile
      profile_link.click
      ProfilePage.new
    end
  end
end
