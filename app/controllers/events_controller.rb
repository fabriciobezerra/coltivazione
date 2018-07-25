# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_harvest, only: %i[new create]

  def new
    @event = Event.new
  end

  def create
    @event = @harvest.events.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to harvest_path(@event.harvest)
    else
      render :new
    end
  end

  private

  def set_harvest
    @harvest = Harvest.find(params[:harvest_id])
  end

  def event_params
    params.require(:event).permit(:text, :date)
  end
end
