class AddApprovedToGym < ActiveRecord::Migration[5.1]
  def change
    add_column :gyms, :approved, :boolean, null: false, default: false
  end
end
