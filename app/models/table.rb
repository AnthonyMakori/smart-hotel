require 'rqrcode'
class Table < ApplicationRecord
  after_create :generate_qr_code

  def generate_qr_code
    qr = RQRCode::QRCode.new("http://localhost:3000/tables/#{self.id}")
    png = qr.as_png(size: 200)
    File.binwrite(Rails.root.join('public/images/qrcodes', "table_#{id}.png"), png.to_s)
  end
end
