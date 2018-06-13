# frozen_string_literal: true

class FarmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: [:show]
  before_action :validate_user, only: [:show]

  def show; end

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

  def validate_user
    return if @farm.user == current_user
    flash[:alert] = 'Permissão para ver a fazenda recusada'
    redirect_to root_path
  end
end
