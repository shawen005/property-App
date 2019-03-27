json.extract! listing_image, :id, :post_id, :img, :created_at, :updated_at
json.url listing_image_url(listing_image, format: :json)
