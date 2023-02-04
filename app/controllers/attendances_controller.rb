class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    current_user.attended_events << @event
  end
end
