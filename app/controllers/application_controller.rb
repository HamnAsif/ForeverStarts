class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if resource.authenticatable_type == "Couple"
      couples_dashboard_path
    elsif resource.authenticatable_type == "Vendor"
      vendors_dashboard_path
    else 
      root_path
    end
  end
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  def after_sign_out_path_for(resource)
    root_path
  end
end
