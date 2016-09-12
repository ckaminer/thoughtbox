class Api::V1::LinksController < ApplicationController
  def update
    link = Link.find(params[:id])
    if params["read"]
      link.read = !link.read
      link.save
    else
      link.update(params)
    end
  end
end
