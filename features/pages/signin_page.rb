# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class SigninPage < Elopage::MainPage
    element :sign_in_button, :xpath, "(//button[normalize-space()='Sign in'])[1]"
    element :email_input, '#email'
    element :password_input, '#password'

    def credentials
      Support::UserCredentials.instance
    end

    def set_email
      email_input.set(credentials.login)
    end

    def set_password
      password_input.set(credentials.password)
    end
    def tap_sign_in
      sign_in_button.click
    end
  end
end
