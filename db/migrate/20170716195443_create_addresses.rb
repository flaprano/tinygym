class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address_type
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
