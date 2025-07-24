class Couples::NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @couple = current_user.authenticatable
    end
end