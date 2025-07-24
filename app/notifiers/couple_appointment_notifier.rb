
class CoupleAppointmentNotifier < Noticed::Event
  deliver_by :database

  param :appointment

  def message
    "Your appointment on #{params[:appointment].appointment_datetime.strftime('%B %d, %Y at %I:%M %p')} has been #{params[:appointment].appointment_status}."
  end

  
  def url
    Rails.application.routes.url_helpers.couple_path(params[:vendor])
  end
end







