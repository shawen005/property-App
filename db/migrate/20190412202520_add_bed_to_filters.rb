class AddBedToFilters < ActiveRecord::Migration[5.2]
  def change
    add_column :filters, :bed, :integer
  end
end
