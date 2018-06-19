# frozen_string_literal: true

class HarvestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: %i[index new create finish finished]
  before_action :set_harvest, only: %i[show finish finished]
  before_action -> { validate_user(@harvest) }, only: [:show]

  def index
    @harvests = @farm.harvests
  end

  def show; end

  def new
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

  def finish; end

  def finished
    @harvest.update(harvest_update_params)
    redirect_to farm_harvest_path(@farm, @harvest)
  end

  private

  def set_harvest
    @harvest = Harvest.find(params[:id])
  end

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

  def harvest_update_params
    params.require(:harvest).permit(:final_notes, :state, :total_collected)
  end

  def harvest_params
    params.require(:harvest).permit(:seed, :initial_date, :end_date_prediction,
                                    :employee, :state)
  end
end
