require "rails_helper"

RSpec.feature "guest creates account" do
  context "valid information given" do
    scenario "visitor creates account" do
      visit root_path
      click_on "Sign Up"

      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Account"

      expect(current_path).to eq links_path
    end
  end

  context "invalid information" do
    scenario "email is already taken" do
      user1 = create(:user)
      visit root_path
      click_on "Sign Up"

      fill_in "Email", with: user1.email
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Account"

      expect(current_path).to eq new_user_path
      expect(page).to have_content "Email has already been taken"
    end

    scenario "password confirmation doesn't match" do
      visit root_path
      click_on "Sign Up"

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "notmatchingpassword"
      click_on "Create Account"

      expect(current_path).to eq new_user_path
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
