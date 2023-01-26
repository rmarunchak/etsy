# frozen_string_literal: true

And(/^I open profile page$/) do
  PageFactory.dashboard_page.tap_profile_menu
  PageFactory.dashboard_page.tap_profile
end

And(/^I change image$/) do
  PageFactory.profile_page.tap_edit
  PageFactory.profile_page.image_upload
end