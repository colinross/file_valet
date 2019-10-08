json.extract! payload, :label, :description, :uuid, :created_at
json.qr_code payload.qr_code.to_data_url
json.url payload_url(payload, format: :json)
