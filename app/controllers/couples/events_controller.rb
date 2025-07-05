class Couples::EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = current_user.authenticatable.events.new
  end

  def create
    @event = current_user.authenticatable.events.new(event_params)
    if @event.save
      redirect_to couples_dashboard_path, notice: "Event added!"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end