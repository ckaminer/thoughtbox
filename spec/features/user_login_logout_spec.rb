require "rails_helper"

RSpec.feature "User Logs In and Logs Out" do
  context "Login tests" do
    scenario "existing user can login" do
      user = create(:user)
      visit login_path
      fill_in "e-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Login"

      expect(current_path).to eq links_path
      expect(page).to have_content user.email
    end

    scenario "guest cannot login" do
      visit login_path
      fill_in "e-mail", with: "Billy Joe is not an email"
      fill_in "Password", with: "password"
      click_button "Login"

      assert page.has_content?("Invalid login. Please try again.")
      assert page.has_content?("Login")
    end

    scenario "registered user cannot login with wrong password" do
      user = create(:user)
      visit login_path
      fill_in "e-mail", with: user.email
      fill_in "Password", with: "notmypassword"
      click_button "Login"

      assert page.has_content?("Invalid login. Please try again.")
      assert page.has_content?("Login")
    end
  end

  context "logout test" do
    scenario "user is returned to login page" do
      user = create(:user)
      visit login_path
      fill_in "e-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Login"

      assert page.has_content?(user.email)

      click_link "Logout"

      assert page.has_content?("Successfully logged out")
      assert page.has_content?("Login")
    end
  end
end
