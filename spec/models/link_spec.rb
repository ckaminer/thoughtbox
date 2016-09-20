require 'rails_helper'

RSpec.describe Link, type: :model do
  context "validations" do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should belong_to(:user) }
  end

  context "url validation" do
    it "should allow http urls" do
      link = Link.new(url: "http://thisisgood.com", title: "lets go", user_id: 1)
      expect(link.valid_url?).to eq true
    end

    it "should not allow non-http urls" do
      link = Link.new(url: "badurl", title: "lets go", user_id: 1)
      expect(link.valid_url?).to eq false
    end
  end
end
