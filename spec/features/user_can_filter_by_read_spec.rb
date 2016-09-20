require "rails_helper"

RSpec.feature "User can filter links by read status", js: true do
  context "they select an option" do
    scenario "only links with matching status are shown" do
      user = create(:user)
      search_link = create(:link, title: "show me", url: "http://www.thisone.com", user: user, read: true)
      second_link = create(:link, title: "hide me", url: "http://www.thisstinks.com", user: user)
      login(user)

      visit "/links"

      select "Read", :from => "link[filter_status]"
      expect(page).to have_content "show me"
      expect(page).to_not have_content "hide me"

      select "Unread", :from => "link[filter_status]"
      expect(page).to_not have_content "show me"
      expect(page).to have_content "hide me"

      select "All", :from => "link[filter_status]"
      expect(page).to have_content "show me"
      expect(page).to have_content "hide me"
    end
  end
end
