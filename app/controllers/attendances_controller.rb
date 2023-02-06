class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = current_user.attendances.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event.attedandees << current_user
  end

  def attedance_params
    params.require(:attendance).permit(:event_id)
  end
end
