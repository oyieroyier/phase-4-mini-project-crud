class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_response
  # protect_from_forgery with: :null_session

  def index
    render json: Spice.all
  end

  def create
    render json: Spice.create(spices_params), status: :created
  end

  def update
    spice = Spice.find(params[:id])
    spice.update(spices_params)
		render json: spice
  end

  def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    head :no_content
  end

  private

  def spices_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
