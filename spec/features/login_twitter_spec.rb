require "rails_helper"
  RSpec.feature "Posting Tweet" do
    before do
      visit "/"
      click_link "Sign In"
      fill_in "Email", with: "3dward.yu@gmail.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
    end

    scenario "A logs in with their twitter" do
      click_link "Connect to Twitter"
      click_button "Authorize"

      expect(page.current_path).to eq(profile_path)
    end
  end
