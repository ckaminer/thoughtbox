require "rails_helper"

RSpec.feature "User toggles link read status" do
  context "valid url" do
    scenario "link is added to links list on index page" do
      user = create(:user)
      login(user)

      fill_in "Url", with: "http://facebook.com"
      fill_in "Title", with: "facebook"
      click_on "Create Link"
      expect(page).to have_css '.unread'

      click_on "Mark as Read"

      expect(page).to have_content "Mark as Unread"
      expect(page).to have_css '.read'
    end
  end
end
