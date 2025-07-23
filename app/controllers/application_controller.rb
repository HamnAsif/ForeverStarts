class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!, unless: :admin_controller?
  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_root_path
    when User
      case resource.authenticatable_type
      when "Couple"
        couples_dashboard_path
      when "Vendor"
        vendors_dashboard_path
      else
        root_path
      end
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
   



  private

  def admin_controller?
    is_active_admin_controller? || is_admin_devise_controller?
  end

  def is_active_admin_controller?
    self.class.name.start_with?("Admin::") || controller_path.start_with?("admin/")
  end

  def is_admin_devise_controller?
    devise_controller? && resource_class == AdminUser
  end
end
