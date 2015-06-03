class EventsController < ApplicationController

  def index
    @events = Event.where(family_id: session[:user_id ])
  end

  def create
    @event= Event.new(event_params)
    @event.family = current_user
    @event.save!
    redirect_to :back
  end

  private
  def event_params
    params.require(:event).permit :title, :start_time, :end_time, :family_id, :member_id
  end
end
