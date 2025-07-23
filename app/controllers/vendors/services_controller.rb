class Vendors::ServicesController < ApplicationController
  before_action :authenticate_user! 


  def create
  @vendor = current_user.authenticatable
  @service = @vendor.services.build(service_params)

  if @service.save
    redirect_to new_vendors_service_path, notice: "Service created successfully"
  else
   
    render :new, status: :unprocessable_entity
  end
end


  def new
    @vendor = current_user.authenticatable
    @services = current_user.authenticatable.services
    @service = Service.new
  end

  def show
     @service = Service.find(params[:id])
     @ratings = @service.ratings.order(created_at: :desc)
  end
  def edit
  end

  def update
    @service = Service.find(params[:id])

    new_images = service_params[:images]
    clean_params = service_params.except(:images) 

    if @service.update(clean_params)
      if new_images.present?
        new_images.each do |image|
          @service.images.attach(image)
        end
      end

      redirect_to vendors_service_path(@service), notice: "Service updated successfully!"
    else
      flash.now[:alert] = "Update failed: #{@service.errors.full_messages.to_sentence}"
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to vendors_services_path, notice: "Service deleted successfully!"
  end

  def delete_image
    @service = Service.find(params[:id])
    image = @service.images.find(params[:image_id])
    image.purge 

    redirect_to vendors_service_path(@service), notice: "Image deleted successfully."
  end

  private

  def service_params
    params.require(:service).permit(:title, :caption, :price,images: [])
  end
end
