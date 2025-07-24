class CoupleRatingNotifier < Noticed::Event
  deliver_by :database

  param :rating

  def message
    "You've received a new rating from a couple #{params[:rating].rating.couple.groom_name} and #{params[:rating].rating.couple.bride_name}."
  end

  
  def url
    Rails.application.routes.url_helpers.couple_path(params[:vendor])
  end
end