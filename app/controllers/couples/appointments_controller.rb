class Couples::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_couple

  def index
    @appointments = @couple.appointments.includes(service: :vendor)
  end

  def create
    @appointment = @couple.appointments.new(appointment_params)
    service = Service.find(params[:appointment][:service_id])
    @appointment.service = service
    vendor = @appointment.service.vendor

    if @appointment.save
      CoupleAppointmentRequestNotifier.with(
        appointment: @appointment, 
        message: "#{@couple.bride_name} and #{@couple.groom_name} has requested an appointment with you.",
        url: "/vendors/appointments"
      ).deliver_later(vendor)

      redirect_to couples_appointments_path, notice: "Appointment booked!"
    else
      puts @appointment.errors.full_messages 
      redirect_back fallback_location: root_path, alert: "Failed to book appointment"
    end
  end

  def cancel
    @appointment = @couple.appointments.find(params[:id])
    vendor = @appointment.service.vendor
    if @appointment.update(appointment_status: :cancelled)
      CoupleAppointmentNotifier.with(
        appointment: @appointment, 
        message: "Your appointment on #{@appointment.appointment_datetime.strftime('%B %d, %Y at %I:%M %p')} has been #{@appointment.appointment_status}.",
        url: "/vendors/appointments"
      ).deliver_later(vendor)
      redirect_to couples_appointments_path, alert: "Appointment cancelled."
    else
      redirect_to couples_appointments_path, alert: "Failed to cancel appointment."
    end
  end

  def complete
    @appointment = @couple.appointments.find(params[:id])
    vendor = @appointment.service.vendor
    if @appointment.update(appointment_status: :completed)
      CoupleAppointmentNotifier.with(
        appointment: @appointment, 
        message: "Your appointment on #{@appointment.appointment_datetime.strftime('%B %d, %Y at %I:%M %p')} has been #{@appointment.appointment_status}.",
        url: "/vendors/appointments"
      ).deliver_later(vendor)
      redirect_to couples_appointments_path, alert: "Appointment completed."
    else
      redirect_to couples_appointments_path, alert: "Failed to mark as completed."
    end
  end

  private

  def set_couple
    @couple = current_user.authenticatable
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :details, :service_id)
  end
end
