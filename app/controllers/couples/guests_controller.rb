class Couples::GuestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @events = current_user.authenticatable.events
  end
  def create

    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to couples_guest_path, notice: "Guest added!"
    else
      @guest.destroy
      render :new
    end
  end
  private
  def guest_params
    params.require(:guest).permit(:name, :whatsapp, :event_id)
  end
end



