class AttendancesController < ApplicationController
  def new
    @attendance = current_user.attendances.new
  end

  def create
    @event = Event.find(params[:event_id])
    current_user.attended_events << @event
  end

  def attedance_params
    params.require(:attendance).permit(:event_id)
  end
end
