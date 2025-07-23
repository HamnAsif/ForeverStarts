class Couples::EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = current_user.authenticatable.events.new
  end

  def create
    @event = current_user.authenticatable.events.new(event_params)
    if @event.save
      redirect_to couples_event_path(@event), notice: "Event added!"
    else
      render :new
    end
  end

  def show
    @event = current_user.authenticatable.events.find(params[:id])
    @todo_list = TodoList.new
    @todos = @event.todo_lists
    @editing_todo = TodoList.find_by(id: params[:edit]) if params[:edit].present?

  end

  def destroy
    @event = current_user.authenticatable.events.find(params[:id])
    @event.destroy
    redirect_to couples_dashboard_path, notice: "Event deleted successfully."
  end
  def update
    @event = current_user.authenticatable.events.find(params[:id])
    if @event.update(event_params)
      redirect_to couples_event_path(@event), notice: "Event updated!"
    else
      # Rebuild these for the view to work properly
      @todo_list = TodoList.new
      @todos = @event.todo_lists
      @editing_todo = TodoList.find_by(id: params[:edit]) if params[:edit].present?

      render :show, status: :unprocessable_entity
    end
  end






  private

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end
