class Couples::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_couple


  def edit
  end

  def update
    @couple = current_user.authenticatable

    if current_user.update(user_params) && @couple.update(couple_params)
      redirect_to couples_profile_path, notice: "Profile updated!"
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
    params.require(:user).permit(:profile_image, :email, :password, :password_confirmation)
  end
end
