class AddBathToFilters < ActiveRecord::Migration[5.2]
  def change
    add_column :filters, :bath, :integer
  end
end
