# frozen_string_literal: true

class HarvestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: %i[index new create]
  before_action :set_harvest, only: %i[show finish finished]
  before_action -> { validate_user(@harvest) }, only: [:show]

  def index
    @harvests = @farm.harvests.decorate
  end

  def show; end

  def new
    @harvest = Harvest.new
  end

  def create
    @harvest = @farm.harvests.build(harvest_params)
    @harvest.user = current_user
    if @harvest.save
      redirect_to harvest_path(@harvest)
    else
      render :new
    end
  end

  def finish; end

  def finished
    if @harvest.update(harvest_finish_params)
      redirect_to harvest_path(@harvest)
    else
      render :finish
    end
  end

  private

  def set_harvest
    @harvest = Harvest.find(params[:id]).decorate
  end

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

  def harvest_finish_params
    params.require(:harvest).permit(:final_notes, :state, :total_collected)
  end

  def harvest_params
    params.require(:harvest).permit(:seed, :initial_date, :end_date_prediction,
                                    :employee, :state)
  end
end
