# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class HomePage < Elopage::MainPage
    $credentials = Support::Helpers.new.retrieve_credentials
    set_url $credentials[0]['base_url']
    element :allow_cookies_button, '#CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll'
    #element :login_link, :xpath, "//a[contains(text(),'Login')]"
    element :login_link, '.elementor-heading-title a'

    def initialize
      @logs = []
      File.open('logfile.log', 'w').close
    end

    def open_homepage
      log_info(__method__)
      @home_page = Elopage::HomePage.new
      @home_page.load
      self
    end

    def tap_login
      log_info(__method__)
      wait_until_login_link_visible
      login_link.click
      ensure_staging_environment
      Elopage::SigninPage.new
    end

    def allow_cookies
      log_info(__method__)
      wait_until_allow_cookies_button_visible
      allow_cookies_button.click
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

    def ensure_staging_environment
      unless current_url.include?('staging.elopage.com')
        route = current_url.split('elopage.com').last
        staging_url = "https://staging.elopage.com#{route}"
        visit staging_url
      end
    end

  end
end
