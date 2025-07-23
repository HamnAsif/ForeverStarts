require 'mini_magick'

class CardImageBuilder
  TEMPLATE_PATH = Rails.root.join('app/assets/images/card_templates')

  def initialize(card)
    @card = card
  end

  def generate_image(output_path)
    template_file = TEMPLATE_PATH.join("#{@card.template}.png")
    image = MiniMagick::Image.open(template_file.to_s)

    invitation_line = @card.invitation_line.to_s
    couple_names = "#{@card.couple.bride_name} & #{@card.couple.groom_name}"
    event_name = @card.event&.event_name.to_s
    event_date = @card.event&.event_date&.strftime('%B %d, %Y').to_s
    event_time = @card.event_time&.strftime('%I:%M %p').to_s
    venue = @card.venue.to_s
    rsvp = @card.rsvp_contact.to_s

    image.combine_options do |c|
      c.gravity 'center'
      c.fill '#303030'

      # Draw Invitation Line
      c.pointsize '24'
      c.draw "text 0,-250 '#{invitation_line}'"
      c.fill '#383838'

      # Couple Names
      c.pointsize '52'
      c.draw "text 0,-170 '#{couple_names}'"

      # Event Name
      c.pointsize '34'
      c.draw "text 0,-90 '#{event_name}'"

      # Save the Date
      c.pointsize '20'
      c.draw "text 0,-40 'SAVE THE DATE'"

      # Event Date
      c.pointsize '32'
      c.draw "text 0,10 '#{event_date}'"

      # Time
      c.pointsize '24'
      c.draw "text 0,60 'Time: #{event_time}'"

      # Venue
      c.pointsize '24'
      c.draw "text 0,110 'Venue: #{venue}'"

      # RSVP
      c.pointsize '24'
      c.draw "text 0,160 'RSVP: #{rsvp}'"
    end

    image.write(output_path)
  end
end
