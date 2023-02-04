class AttendancesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @attendance = current_user.attendances.new
  end

  def create
    @attendance = current_user.attendances.new(attedance_params)
    if @attendance.save
      redirect_to event_path(@attendance.attendee_id)
    end
  end

  def attedance_params
    params.require(:attendance).permit(:event_id)
  end
end
