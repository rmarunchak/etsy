# frozen_string_literal: true

require_relative 'main_page'
require_relative '../support/helpers'
require_relative '../support/relatives'

module Elopage
  class ProfilePage < Elopage::MainPage
    element :edit_button, :xpath, "//button[@class='elo-editable-image__edit-btn']"
    element :upload_button, :xpath, "//label[@for='image-loader-upload']"

    def tap_edit
      edit_button.click
    end

    def image_upload
      puts "231123"
      browser.file_field(upload_button).set("/Users/rmaru/Downloads/the-sopranos.gif")
    end

  end
end
