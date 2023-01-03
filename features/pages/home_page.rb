# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class HomePage < Elopage::MainPage
    $credentials = Support::Helpers.new.retrieve_credentials
    set_url $credentials[0]['base_url']
    element :allow_cookies_button, '#CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll'
    element :login_link, :xpath, "//a[contains(text(),'Login')]"

    def open_homepage
      @home_page = Elopage::HomePage.new
      @home_page.load
      self
    end

    def tap_login
      wait_until_login_link_visible
      login_link.click
      Elopage::SigninPage.new
    end

    def allow_cookies
      wait_until_allow_cookies_button_visible
      allow_cookies_button.click
    end
  end
end
