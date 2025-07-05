# app/controllers/couples/profile_controller.rb
class Couples::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_couple

  def show
    # Show profile info if needed
  end

  def edit
  end

  def update
    if @couple.update(couple_params) && current_user.update(user_params)
      redirect_to couples_dashboard_path, notice: "Profile updated successfully!"
    else
      flash.now[:alert] = "Update failed!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_couple
    @couple = current_user.authenticatable 
  end

  def couple_params
    params.require(:couple).permit(:bride_name, :groom_name)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
