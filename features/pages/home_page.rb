# frozen_string_literal: true

class HomePage < BasePage

  def open_homepage
    @home_page = HomePage.new
    @home_page.load
  end
end

