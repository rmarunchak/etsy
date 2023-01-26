require_relative '../support/env'

class PageFactory

  def self.home_page
    @home_page ||= Elopage::HomePage.new
  end

  def self.sign_in_page
    @sign_in_page ||= Elopage::SigninPage.new
  end

  def self.bank_wire_page
    @bank_wire_page ||= Elopage::BankWirePage.new
  end

  def self.checkout_page
    @checkout_page ||= Elopage::CheckoutPage.new
  end

  def self.dashboard_page
    @dashboard_page ||= Elopage::DashboardPage.new
  end

  def self.main_page
    @main_page ||= Elopage::MainPage.new
  end

  def self.product_page
    @product_page ||= Elopage::ProductPage.new
  end

  def self.shop_page
    @shop_page ||= Elopage::ShopPage.new
  end

  def self.signin_page
    @signin_page ||= Elopage::SigninPage.new
  end

  def self.profile_page
    @profile_page ||= Elopage::ProfilePage.new
  end
end