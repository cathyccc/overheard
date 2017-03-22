require "rails_helper"
  RSpec.feature "Posting Tweet" do
    before do
      visit "/"
      click_link "Sign In"
      fill_in "Email", with: "3dward.yu@gmail.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      end

    scenario "A user logs in with their twitter" do
      visit "/profile"
      click_link "Connect to Twitter"

      # expect(page.current_path).to eq(profile_path)
    end
  end
