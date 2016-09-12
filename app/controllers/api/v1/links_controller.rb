class Api::V1::LinksController < ApplicationController
  def index
    render json: Link.where(user: current_user)
  end

  def update
    link = Link.find(params[:id])
    if params["read"]
      link.read = !link.read
      link.save
      render json: link
    else
      link.update(params)
    end
  end
end
