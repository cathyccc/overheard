require "rails_helper"
  RSpec.feature "Posting Tweet" do
    before do
      visit "/"
      click_link "Sign In"
      fill_in "Email", with: "3dward.yu@gmail.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
    end
    scenario "A user posts a tweet" do
      visit "/profile"
      fill_in "post-tweet", with: "Hello World!"
      click_button "tweet"

      expect(page).to have_content "Tweet Posted"
      expect(page.current_path).to eq(profile_path)
    end
  end
