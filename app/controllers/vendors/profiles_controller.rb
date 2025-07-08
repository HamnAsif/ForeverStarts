
class Vendors::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor

  def show
  end

  def edit
  end

  def update
    if @vendor.update(vendor_params) && current_user.update(user_params)
      redirect_to vendors_dashboard_path, notice: "Profile updated successfully!"
    else
      flash.now[:alert] = "Update failed!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_vendor
    @vendor = current_user.authenticatable 
  end

  def vendor_params
    params.require(:vendor).permit(:username, :category, :contact, :location, :description)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
