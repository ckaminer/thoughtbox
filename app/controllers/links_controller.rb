require 'uri'
class LinksController < ApplicationController
  def index
    if current_user
      @new_link = Link.new
    else
      render file: "public/404"
    end
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if link.valid_url?
      link.save
    else
      flash[:error] = "Invalid URL"
    end
    redirect_to links_path
  end

  def update
    link = Link.find(params[:id])
    if link.valid_url?(params[:link][:url])
      link.update(link_params)
      redirect_to links_path
    else
      flash[:error] = "Invalid URL"
      redirect_to edit_link_path(link)
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

private
  def link_params
    params.require(:link).permit(:url, :title, :user, :read)
  end
  #
  # def valid_url?(url)
  #   uri = URI.parse(url)
  #   uri.kind_of?(URI::HTTP)
  # rescue URI::InvalidURIError
  #   false
  # end
end
