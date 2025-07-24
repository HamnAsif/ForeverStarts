class NewVendorSignedUpNotifier < Noticed::Event
  required_param :vendor

  def message
    "#{params[:vendor].username} just joined as a #{params[:vendor].category}!"
  end

  def url
    Rails.application.routes.url_helpers.vendor_path(params[:vendor])
  end
end
