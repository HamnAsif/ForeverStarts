class Couples::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
  end

  def create
    couple = Couple.new(bride_name: params[:bride_name], groom_name: params[:groom_name])
    if couple.save
      user = User.new(
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        authenticatable: couple
      )
      if user.save
        sign_in(user)
        redirect_to couples_dashboard_path, notice: "Signed up successfully as a Couple."
      else
        couple.destroy
        render :new, alert: "User creation failed"
      end
    else
      render :new, alert: "Couple creation failed"
    end
  end
end
