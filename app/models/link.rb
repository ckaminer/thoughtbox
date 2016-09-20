require 'uri'
class Link < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :title, presence: true
  validates :user_id, presence: true

  def valid_url?(check = url)
    uri = URI.parse(check)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end
