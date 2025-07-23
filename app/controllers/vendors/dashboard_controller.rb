class Vendors::DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @vendor = current_user.authenticatable
    @service = Service.new
  end
end
