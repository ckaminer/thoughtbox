require "rails_helper"

RSpec.feature "User can sort links alphabetically", js: true do
  context "they click teh title header" do
    scenario "links are sorted alphabetically by title" do
      user = create(:user)
      second_link = create(:link, title: "Link B", url: "http://www.linka.com", user: user)
      first_link = create(:link, title: "Link A", url: "http://www.linkb.com", user: user)
      third_link = create(:link, title: "Link C", url: "http://www.linkb.com", user: user)
      login(user)

      visit "/links"

      click_on "Title"

      links = page.all("tr")

      expect(links[0]).to have_content "Title"
      expect(links[1]).to have_content "Link A"
      expect(links[2]).to have_content "Link B"
      expect(links[3]).to have_content "Link C"


      click_on "Title"

      reverse_links = page.all("tr")

      expect(reverse_links[0]).to have_content "Title"
      expect(reverse_links[1]).to have_content "Link C"
      expect(reverse_links[2]).to have_content "Link B"
      expect(reverse_links[3]).to have_content "Link A"
    end
  end
end
