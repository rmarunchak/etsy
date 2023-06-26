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
      file_path = "/Users/rmaru/Documents/unnamed.png"
      upload_button.click
      select_file_with_applescript(file_path)
    end

    def select_file_with_applescript(file_path)
      script = <<-SCRIPT
    tell application "System Events"
      keystroke "G" using {command down, shift down}
      delay 0.5
      keystroke "#{file_path}"
      delay 0.5
      keystroke return
      delay 0.5
      keystroke return
    end tell
      SCRIPT

      system("osascript -e '#{script}'")
    end
  end
end
