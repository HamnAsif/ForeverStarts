class Couples::CardsController < ApplicationController
  helper QrCodeHelper

  def new
    @card = Card.new 
    @card.couple = current_user.authenticatable
    @events = current_user.authenticatable.events
  end

  def create
  @card = Card.new(card_params)
  @card.couple = current_user.authenticatable
  @events = current_user.authenticatable.events  

  if @card.save
    redirect_to couples_card_path(@card), notice: "Card created successfully."
  else
    flash.now[:alert] = "Card creation failed: #{@card.errors.full_messages.to_sentence}"
    render :new
  end
end


  def show
 
    @card = Card.find(params[:id])
    @card.couple = current_user.authenticatable
  end

  def download_image
    @card = Card.find(params[:id])
    output_path = Rails.root.join("public/cards/card_#{@card.id}.png")
    CardImageBuilder.new(@card).generate_image(output_path)

    send_file output_path, type: "image/png", disposition: "attachment"
  end

  private

  def card_params
    params.require(:card).permit(:event_time, :venue, :rsvp_contact, :invitation_line, :template, :event_id)
  end
end
