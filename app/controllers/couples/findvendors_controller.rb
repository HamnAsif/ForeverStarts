class Couples::FindvendorsController < ApplicationController
    def index
        @q = Vendor.ransack(params[:q])
        @vendors = @q.result
    end
    def show
        @vendor = Vendor.find(params[:id])
        @appointment = Appointment.new

    end
end