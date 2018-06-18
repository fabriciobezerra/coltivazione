# frozen_string_literal: true

class FarmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: [:show]
  before_action -> { validate_user(@farm) }, only: [:show]

  def show; end

  def index
    @farms = current_user.farms
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user
    if @farm.save
      redirect_to @farm
    else
      render :new
    end
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :address, :size, :latitude, :longitude)
  end
end
