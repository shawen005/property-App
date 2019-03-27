class AddListingIdToListingImage < ActiveRecord::Migration[5.2]
  def change
    add_column :listing_images, :listing_id, :integer
  end
end
