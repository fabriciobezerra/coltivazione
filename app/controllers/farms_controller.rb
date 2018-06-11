# frozen_string_literal: true

class FarmsController < ApplicationController
  before_action :authenticate_user!

  def show
    @farm = Farm.find(params[:id])
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

  def farm_params
    params.require(:farm).permit(:name, :address, :size, :latitude, :longitude)
  end
end
