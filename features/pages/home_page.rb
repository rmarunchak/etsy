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

    def log_info(method_name, class_name)
      log = Logger.new(STDOUT)
      log.info("#{method_name} on #{class_name}")
    end

    def open_homepage
      #log_info(__method__, self.class.name.gsub('Elopage::', ''))
      @home_page = Elopage::HomePage.new
      @home_page.load
      self
    end

    def tap_login
      #log_info(__method__, self.class.name.gsub('Elopage::', ''))
      wait_until_login_link_visible
      login_link.click
      Elopage::SigninPage.new
    end

    def allow_cookies
      #log_info(__method__, self.class.name.gsub('Elopage::', ''))
      wait_until_allow_cookies_button_visible
      allow_cookies_button.click
    end
  end
end
