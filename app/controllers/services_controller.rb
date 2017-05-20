class ServicesController < ApplicationController
  def index
    @services = Service.all.order(position: :asc)
  end

  def show
    @service = Service.find_by(slug: params[:id])
  end
end
