class Vendors::AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vendor = current_user.authenticatable
    @appointments = @vendor.appointments.order(appointment_datetime: :asc)
  end

  def confirm
  @vendor = current_user.authenticatable
  @appointment = Appointment.find(params[:id])
  couple = @appointment.couple

  if @appointment.update(appointment_status: :confirmed)
    VendorAppointmentNotifier.with(
        appointment: @appointment, 
        message: "Your appointment on #{@appointment.appointment_datetime.strftime('%B %d, %Y at %I:%M %p')} has been #{@appointment.appointment_status}.",
        url: "/couples/appointments"
      ).deliver_later(couple)

    redirect_to vendors_appointments_path, notice: "Appointment confirmed!"
  else
    redirect_to vendors_appointments_path, alert: "Unable to confirm appointment."
  end
end



  def cancel
    @vendor = current_user.authenticatable
    @appointment = Appointment.find(params[:id])
    couple = @appointment.couple

    if appointment.update(appointment_status: :cancelled)
      
      VendorAppointmentNotifier.with(
        appointment: @appointment, 
        message: "Your appointment on #{@appointment.appointment_datetime.strftime('%B %d, %Y at %I:%M %p')} has been #{@appointment.appointment_status}.",
        url: "/couples/appointments"
      ).deliver_later(couple)


      redirect_to vendors_appointments_path, alert: "Appointment cancelled."
    else
      redirect_to vendors_appointments_path, alert: "Unable to cancel appointment."
    end
  end

end
