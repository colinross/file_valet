require 'rqrcode'

class Payload < ApplicationRecord
  validates :label, uniqueness: true, allow_nil: true

  def qr_code
    RQRCode::QRCode.new(Rails.application.routes.url_helpers.payload_url(self)).as_png
  rescue StandardError => e
    Rails.logger.error e.message
    nil
  end
end
