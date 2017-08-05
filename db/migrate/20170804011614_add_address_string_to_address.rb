class AddAddressStringToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :address, :string
  end
end
