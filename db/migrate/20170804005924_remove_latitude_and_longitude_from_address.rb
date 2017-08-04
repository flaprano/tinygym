class RemoveLatitudeAndLongitudeFromAddress < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :latitude, :string
    remove_column :addresses, :longitude, :string
  end
end
