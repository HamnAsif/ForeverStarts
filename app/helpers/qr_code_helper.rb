module QrCodeHelper
  require 'barby'
  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'
  require 'base64'

  def generate_qr_for_card
    url = "https://ca84c18e04ee.ngrok-free.app/cards/wedding_card.jpg"

    barcode = Barby::QrCode.new(url, level: :q, size: 5)
    base64 = Base64.encode64(barcode.to_png(xdim: 5))
    "data:image/png;base64,#{base64}"
  end
end
