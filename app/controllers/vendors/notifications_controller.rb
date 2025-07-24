class Vendors::NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @vendor = current_user.authenticatable
    end
end