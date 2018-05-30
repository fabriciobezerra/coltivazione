class FarmsController < ApplicationController
  def show
    @farm = Farm.find(params[:id])
  end

  def new
    @farm = Farm.new
  end

  def create
    farm = Farm.create(farm_params)

    redirect_to farm
  end

  private

  def farm_params
    params.require(:farm).permit(:name, :address, :size, :latitude, :longitude)
  end
end
