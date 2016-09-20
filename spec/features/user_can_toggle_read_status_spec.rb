require "rails_helper"

RSpec.feature "User toggles link read status", js: true do
  context "valid url" do
    scenario "unread becomes read" do
      user = create(:user)
      login(user)

      fill_in "Url", with: "http://facebook.com"
      fill_in "Title", with: "facebook"
      click_on "Create Link"
      expect(page).to have_css '.Unread'

      click_on "Mark as Read"

      expect(page).to have_content "Mark as Unread"
      expect(page).to have_css '.Read'
    end

    scenario "read becomes unread" do
      user = create(:user)
      create(:link, title: "read link", url: "http://www.thisone.com", user: user, read: true)
      login(user)

      expect(page).to have_css '.Read'

      click_on "Mark as Unread"

      expect(page).to have_content "Mark as Read"
      expect(page).to have_css '.Unread'
    end
  end
end
