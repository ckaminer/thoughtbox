require "rails_helper"

RSpec.feature "User edits link", js: true do
  context "valid url" do
    scenario "updated url shows on page" do
      user = create(:user)
      login(user)
      create_link
      click_on "Edit"

      fill_in "Url", with: "http://facebook.org"
      click_on "Update Link"
      expect(page).to have_content "http://facebook.org"
      expect(page).to have_content "facebook"
      expect(page).to_not have_content "http://facebook.com"
    end
  end

  context "invalid url" do
    scenario "link is not updated and error message is returned" do
      user = create(:user)
      login(user)
      create_link
      click_on "Edit"

      fill_in "Url", with: "invalidurl"
      click_on "Update Link"

      expect(page).to have_content "Invalid URL"
      expect(page).to_not have_content "invalidurl"
    end
  end

  context "Not able to edit" do
    scenario "guest" do
      user = create(:user)
      link = create(:link, user: user)

      visit "/links/#{link.id}/edit"

      expect(page).to have_content "The page you were looking for doesn't exist."
    end

    scenario "guest" do
      user = create(:user)
      link = create(:link, user: user)
      other_user = create(:user)
      login(other_user)

      visit "/links/#{link.id}/edit"

      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
end
