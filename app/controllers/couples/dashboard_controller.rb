class Couples::DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @wedding = current_user.authenticatable
  end
end
