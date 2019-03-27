json.extract! listing, :id, :title, :price, :description, :location, :type, :status, :bed, :bath, :area, :garage, :address, :created_at, :updated_at
json.url listing_url(listing, format: :json)
