class Vendors::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_vendor_and_user, only: [:edit, :update]

  def new
    @vendor = Vendor.new
    @user = User.new
  end

  def create
    @vendor = Vendor.new(signup_vendor_params)

    if @vendor.save
      @user = User.new(user_params.merge(authenticatable: @vendor))

      if @user.save
        sign_in(@user)
        redirect_to edit_vendors_registration_path(@vendor), notice: "Signed up successfully as a Vendor."
      else
        @vendor.destroy
        flash.now[:alert] = "User creation failed: #{@user.errors.full_messages.to_sentence}"
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Vendor creation failed: #{@vendor.errors.full_messages.to_sentence}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @vendor.update(profile_vendor_params)
      redirect_to vendors_dashboard_path, notice: "Profile updated successfully!"
    else
      flash.now[:alert] = "Update failed: #{@vendor.errors.full_messages.to_sentence}"
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_vendor_and_user
    @user = current_user
    @vendor = @user.authenticatable
  end

  def signup_vendor_params
    params.require(:vendor).permit(:username, :category)
  end

  def profile_vendor_params
    params.require(:vendor).permit(:contact, :location, :description)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
