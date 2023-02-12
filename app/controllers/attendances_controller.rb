class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    current_user.attended_events.delete(Event.find(params[:event_id]))

    redirect_to current_user
  end

  def attedance_params
    params.require(:attendance).permit(:event_id)
  end
end
