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

    def initialize
      @logs = []
    end

    def put_first_name
      log_info(__method__)
      wait_until_first_name_input_visible
      first_name_input.set(Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, ''))
    end

    def put_last_name
      log_info(__method__)
      wait_until_last_name_input_visible
      last_name_input.set(Faker::Name.last_name.gsub(/[^0-9A-Za-z]/, ''))
    end

    def put_email
      log_info(__method__)
      email_input.set(Faker::Internet.safe_email)
    end

    def put_address
      log_info(__method__)
      address_input.set(Faker::Address.street_address)
    end

    def put_zip
      log_info(__method__)
      zip_input.set(Faker::Address.zip)
    end

    def put_city
      log_info(__method__)
      city_input.set(Faker::Address.city)
    end

    def tap_credit_card
      log_info(__method__)
      credit_card_checkbox.click
    end

    def put_card_number
      log_info(__method__)
      card_number_input.click.set('4242 4242 4242 4242 4240')
    end

    def tap_bank_wire
      log_info(__method__)
      bank_wire_checkbox.click
    end

    def tap_custom_checkbox
      log_info(__method__)
      custom_checkbox.click
    end

    def tap_buy
      log_info(__method__)
      buy_button.click
    end

    def attach_logs(step_name)
      Allure.add_attachment(
        name: step_name,
        source: File.read('logfile.log'),
        type: Allure::ContentType::TXT,
        test_case: false
      )
    end

    private

    def log_info(method_name)
      logger = Logger.new('logfile.log')
      log_message = "- #{method_name} on #{self.class.name.demodulize}"
      logger.info(log_message)
      @logs << log_message
    end
  end
end
