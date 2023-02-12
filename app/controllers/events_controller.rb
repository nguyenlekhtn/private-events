class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.all
  end

  def create
    @event = current_user.created_events.build(**event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendance = current_user.attendances.find_by(event: @event)
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event&.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy
    redirect_to root_path, status: :see_other
  end

  def event_params
    params.require(:event).permit(:date, :location, :name)
  end
end
