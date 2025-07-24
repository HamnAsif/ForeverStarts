class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_couple
  before_action :set_appointment
  before_action :set_service
  before_action :set_vendor

  def create
       
    @rating = @couple.ratings.new(rating_params)
    @rating.service = @service
    vendor = @rating.service.vendor
    if @rating.save
      CoupleRatingNotifier.with(
        rating: @rating,
        message: "You received a #{ @rating.stars }-star rating from #{@couple.bride_name} & #{@couple.groom_name}  for the appointment on #{@appointment.appointment_datetime.strftime('%B %d, %Y at %I:%M %p')}.",
        url: "/vendors/services/#{@rating.service_id}"
      ).deliver_later(vendor)

      redirect_to couples_appointments_path, notice: "Thank you for your feedback!"
    else
      redirect_to couples_appointments_path, alert: "Failed to submit rating."
    end
  end

  private

  def set_couple
    @couple = current_user.authenticatable
  end

  def set_appointment
    @appointment = @couple.appointments.find(params[:appointment_id])
  end

  def set_service
    @service = @appointment.service
  end

  def set_vendor
    @vendor = @service.vendor
  end

  def rating_params
    params.require(:rating).permit(:stars, :feedback)
  end
end
