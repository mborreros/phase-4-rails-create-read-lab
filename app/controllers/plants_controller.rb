class PlantsController < ApplicationController

  wrap_parameters format: []

  def index
    all_plants = Plant.all
    render json: all_plants
  end

  def show
    specific_plant = Plant.find_by(id: params[:id])
    render json: specific_plant
  end

  def create
    new_plant = Plant.create(plant_params)
    render json: new_plant, status: :created
  end

  private
  def plant_params
    params.permit(:name, :image, :price)
  end

end
