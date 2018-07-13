# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @harvest = Harvest.find(params[:harvest_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @harvest = Harvest.find(event_params[:harvest_id])
    if @event.save
      redirect_to @event.harvest
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:harvest_id, :user_id, :text, :date)
  end
end
