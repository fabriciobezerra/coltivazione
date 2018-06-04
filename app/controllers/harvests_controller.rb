class HarvestsController < ApplicationController
  def show
    @harvest = Harvest.find(params[:id])
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @harvest = Harvest.new
  end

  def create
    farm = Farm.find(params[:farm_id])
    harvest = farm.harvests.create(harvest_params)
    redirect_to farm_harvest_path(farm, harvest)
  end

  private

  def harvest_params
    params.require(:harvest).permit(:seed, :initial_date, :end_date_prediction,
                                    :employee)
  end
end
