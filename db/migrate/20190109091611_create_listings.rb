class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :location
      t.string :type
      t.string :status
      t.integer :bed
      t.integer :bath
      t.integer :area
      t.integer :garage
      t.string :address

      t.timestamps
    end
  end
end
