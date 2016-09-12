class LinksController < ApplicationController
  def index
    @links = Link.where(user: current_user)
    @new_link = Link.new
  end
end
