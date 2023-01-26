# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class CheckoutPage < Elopage::MainPage
    element :first_name_input, :xpath, "//input[@placeholder='First name']"
    element :last_name_input, :xpath, "//input[@placeholder='Last name']"
    element :email_input, :xpath, " //input[@placeholder='Email']"
    element :address_input, :xpath, "//input[@placeholder='Address']"
    element :zip_input, :xpath, "//input[@placeholder='ZIP']"
    element :city_input, :xpath, "//input[@placeholder='City']"
    element :country_dropdown, :xpath, "//div[contains(@class, 'elo-select-field')]"
    element :credit_card_checkbox, :xpath, "//label[@for='card']"
    element :bank_wire_checkbox, :xpath, "//label[@for='bank_wire']"
    element :card_number_input, '#card-element'
    element :custom_checkbox, :xpath, "//div[@class='cancel-terms']//span[@class='custom-check-mark']"
    element :buy_button, :xpath, "//button[normalize-space()='Buy now!']"

    def put_first_name
      wait_until_first_name_input_visible
      first_name_input.set(Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, ''))
    end

    def put_last_name
      wait_until_last_name_input_visible
      last_name_input.set(Faker::Name.last_name.gsub(/[^0-9A-Za-z]/, ''))
    end

    def put_email
      email_input.set(Faker::Internet.safe_email)
    end

    def put_address
      address_input.set(Faker::Address.street_address)
    end

    def put_zip
      zip_input.set(Faker::Address.zip)
    end

    def put_city
      city_input.set(Faker::Address.city)
    end

    def tap_credit_card
      credit_card_checkbox.click
    end

    def put_card_number
      card_number_input.click.set('4242 4242 4242 4242 4240')
    end

    def tap_bank_wire
      bank_wire_checkbox.click
    end

    def tap_custom_checkbox
      custom_checkbox.click
    end

    def tap_buy
      buy_button.click
    end
  end
end
