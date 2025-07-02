class Vendors::RegistrationsController < ApplicationController
  def new; end

  def create
    vendor = Vendor.new(username: params[:username], category: params[:category])
    if vendor.save
      user = User.new(
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        authenticatable: vendor
      )
      if user.save
        sign_in(user)
        redirect_to root_path, notice: "Signed up successfully as a Vendor."
      else
        vendor.destroy
        render :new, alert: "User creation failed"
      end
    else
      render :new, alert: "Vendor creation failed"
    end
  end
end
