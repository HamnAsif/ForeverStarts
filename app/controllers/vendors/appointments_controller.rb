class Vendors::AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vendor = current_user.authenticatable
    @appointments = @vendor.appointments.order(appointment_datetime: :asc)
  end

  def confirm
    appointment = Appointment.find(params[:id])
    appointment.update(appointment_status: :confirmed)
    redirect_to vendors_appointments_path, notice: "Appointment confirmed!"
  end

  def cancel
    appointment = Appointment.find(params[:id])
    appointment.update(appointment_status: :cancelled)
    redirect_to vendors_appointments_path, alert: "Appointment cancelled."
  end
end
