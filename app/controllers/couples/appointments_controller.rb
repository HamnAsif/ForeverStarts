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

    if @appointment.save
      redirect_to couples_appointments_path, notice: "Appointment booked!"
    else
      puts @appointment.errors.full_messages 
      redirect_back fallback_location: root_path, alert: "Failed to book appointment"
    end
  end

  def cancel
    appointment = @couple.appointments.find(params[:id])
    if appointment.update(appointment_status: :cancelled)
      redirect_to couples_appointments_path, alert: "Appointment cancelled."
    else
      redirect_to couples_appointments_path, alert: "Failed to cancel appointment."
    end
  end

  def complete
    appointment = @couple.appointments.find(params[:id])

    if appointment.update(appointment_status: :completed)
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
