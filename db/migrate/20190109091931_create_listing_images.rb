class CreateListingImages < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_images do |t|
      t.integer :post_id
      t.string :img

      t.timestamps
    end
  end
end
