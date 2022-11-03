# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'

module Etsy
  class HomePage < Etsy::MainPage
    $credentials = retrieve_credentials
    set_url $credentials[0]['base_url']
    element :sign_in_link, :xpath, "//button[contains(text(),'Sign in')]"
    element :email_input, '#join_neu_email_field'
    element :password_input, '#join_neu_password_field'
    element :sign_in_button, :xpath, "//button[@name='submit_attempt']"

    def open_homepage
      @home_page = Etsy::HomePage.new
      @home_page.load
      self
    end

    def sign_in
      sign_in_link.click
      email_input.set($credentials[0]['email_address'])
      password_input.set($credentials[0]['password'])
      sign_in_button.click
      puts '231321'
    end
  end
end
