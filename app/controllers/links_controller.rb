require 'uri'
class LinksController < ApplicationController
  def index
    if current_user
      @links = Link.where(user: current_user)
      @new_link = Link.new
    else
      render file: "public/404"
    end
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if valid_url?(link.url)
      link.save
      redirect_to links_path
    else
      flash[:error] = "Invalid URL"
      redirect_to links_path
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :title, :user, :read)
    end

    def valid_url?(url)
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
end
