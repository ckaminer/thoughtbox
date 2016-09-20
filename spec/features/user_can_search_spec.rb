require "rails_helper"

RSpec.feature "User can search for links", js: true do
  context "enter matching search term" do
    scenario "only links with matching url or title are included" do
      user = create(:user)
      search_link = create(:link, title: "find me", url: "http://www.thisone.com", user: user)
      second_link = create(:link, title: "not good", url: "http://www.thisstinks.com", user: user)
      login(user)

      visit "/links"

      fill_in "search-bar", with: "find me"
      expect(page).to have_content search_link.title
      expect(page).to_not have_content second_link.title

      fill_in "search-bar", with: "thisstinks"
      expect(page).to have_content second_link.title
      expect(page).to_not have_content search_link.title
    end
  end

  context "enter invalid search term" do
    scenario "nothing is shown" do
      user = create(:user)
      search_link = create(:link, title: "find me", url: "http://www.thisone.com", user: user)
      second_link = create(:link, title: "not good", url: "http://www.thisstinks.com", user: user)
      login(user)

      visit "/links"

      fill_in "search-bar", with: "thisdoesn'tmatchanything"
      expect(page).to_not have_content search_link.title
      expect(page).to_not have_content second_link.title
    end
  end
end
