class Couples::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @couple = Couple.new
    @user = User.new
  end

  def create
    @couple = Couple.new(couple_params)

    if @couple.save
      @user = User.new(user_params.merge(authenticatable: @couple))

      if @user.save
        sign_in(@user)
        redirect_to couples_dashboard_path, notice: "Signed up successfully as a Couple."
      else
        @couple.destroy
        flash.now[:alert] = "User creation failed: #{@user.errors.full_messages.to_sentence}"
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Couple creation failed: #{@couple.errors.full_messages.to_sentence}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def couple_params
    params.require(:couple).permit(:bride_name, :groom_name)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
