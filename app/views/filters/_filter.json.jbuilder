json.extract! filter, :id, :area, :status, :min_price, :max_price, :created_at, :updated_at
json.url filter_url(filter, format: :json)
