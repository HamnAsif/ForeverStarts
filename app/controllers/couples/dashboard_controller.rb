class Couples::DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @couple = current_user.authenticatable
  end
end
