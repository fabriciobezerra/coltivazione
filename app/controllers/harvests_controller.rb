# frozen_string_literal: true

class HarvestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_harvest, only: [:show]
  before_action -> { validate_user(@harvest) }, only: [:show]

  def show; end

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

  def set_harvest
    @harvest = Harvest.find(params[:id])
  end

  def harvest_params
    params.require(:harvest).permit(:seed, :initial_date, :end_date_prediction,
                                    :employee, :state)
  end
end
