# frozen_string_literal: true

class HarvestsController < ApplicationController
  before_action :authenticate_user!

  def show
    @harvest = Harvest.find(params[:id])
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @harvest = Harvest.new
  end

  def create
    @farm = Farm.find(params[:farm_id])
    @harvest = @farm.harvests.new(harvest_params)
    @harvest.user = current_user
    if @harvest.save
      redirect_to farm_harvest_path(@farm, @harvest)
    else
      render :new
    end
  end

  private

  def harvest_params
    params.require(:harvest).permit(:seed, :initial_date, :end_date_prediction,
                                    :employee)
  end
end
