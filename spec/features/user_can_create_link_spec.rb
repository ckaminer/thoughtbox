require "rails_helper"

RSpec.feature "User creates link", js: true do
  context "valid url" do
    scenario "link is added to links list on index page" do
      user = create(:user)
      login(user)

      fill_in "Url", with: "http://facebook.com"
      fill_in "Title", with: "facebook"
      click_on "Create Link"

      expect(page).to have_content "http://facebook.com"
      expect(page).to have_content "facebook"
      expect(page).to have_content "Mark as Read"
    end
  end

  context "invalid url" do
    scenario "link is not added to links list and error message is returned" do
      user = create(:user)
      login(user)

      fill_in "Url", with: "nothttp.com"
      fill_in "Title", with: "facebook"
      click_on "Create Link"

      expect(page).to_not have_content "nothttp.com"
      expect(page).to_not have_content "facebook"
      expect(page).to have_content "Invalid URL"
    end
  end
end
