class EventsController < ApplicationController
  def new
    @harvest = Harvest.find(params[:harvest_id])
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to @event.harvest
  end

  private

  def event_params
    params.require(:event).permit(:harvest_id, :user_id, :text, :date)
  end
end
