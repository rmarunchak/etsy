# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'

module Elopage
  class SigninPage < Elopage::MainPage
    element :sign_in_button, :xpath, "(//button[normalize-space()='Sign in'])[1]"
    element :email_input, '#email'
    element :password_input, '#password'

    $credentials = Support::Helpers.new.retrieve_credentials

    def set_email
      email_input.set($credentials[0]['email_address'])
    end

    def set_password
      password_input.set($credentials[0]['password'])
    end

    def tap_sign_in
      sign_in_button.click
    end
  end
end
