class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_response

  def index
    render json: Spice.all
  end

  def create
    render json: Spice.create(spices_params), status: :created
  end

  def update
    spice = find_spice
    spice.update(spices_params)
    render json: spice
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def find_spice
    Spice.find(params[:id])
  end

  def render_not_found_response
    render json: { error: 'Spice not found' }, status: :not_found
  end

  def spices_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
