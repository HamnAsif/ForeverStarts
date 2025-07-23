class Couples::ServicesController < ApplicationController
    def show
        @service = Service.find(params[:id])
        @appointment = Appointment.new
        @vendor = @service.vendor
        @ratings = @service.ratings.order(created_at: :desc)

    end
end