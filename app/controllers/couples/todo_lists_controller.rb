class Couples::TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:create]
  before_action :set_todo, only: [:destroy, :edit, :update, :update_status]

  def create
    @todo = @event.todo_lists.create(todo_list_params)
    redirect_to couples_event_path(@event), notice: 'Task added!'
  end

  def destroy
    if current_user.authenticatable.events.exists?(@todo.event_id)
      @event = @todo.event
      @todo.destroy
      redirect_to couples_event_path(@event), notice: 'Task removed!'
    else
      redirect_to root_path, alert: 'Unauthorized!'
    end
  end

  def edit
    @event = @todo.event
  end

  def update
    if @todo.update(todo_list_params)
      redirect_to couples_event_path(@todo.event), notice: "Task updated!"
    else
      redirect_to couples_event_path(@todo.event, edit_id: @todo.id), alert: "Update failed."
    end
  end

  def update_status
    if current_user.authenticatable.events.exists?(@todo.event_id)
      new_status = @todo.pending? ? :done : :pending
      @todo.update(todolist_status: new_status)
      redirect_to couples_event_path(@todo.event)
    else
      redirect_to root_path, alert: 'Unauthorized!'
    end
  end

  private

  def set_event
    @event = current_user.authenticatable.events.find(params[:event_id])
  end

  def set_todo
    @todo = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :todolist_status)
  end
end
