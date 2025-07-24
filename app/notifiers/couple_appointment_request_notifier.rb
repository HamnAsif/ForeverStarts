class CoupleAppointmentRequestNotifier < Noticed::Event
  deliver_by :database

  param :appointment

  def message
    "#{params[:appointment].appointment.couple.groom_name} and #{params[:appointment].appointment.couple.bride_name} has requested an appointment with you."
  end

  
  def url
    Rails.application.routes.url_helpers.couple_path(params[:vendor])
  end
end