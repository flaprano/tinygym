class CreateGyms < ActiveRecord::Migration[5.1]
  def change
    create_table :gyms do |t|
      t.string :name, null: false
      t.time :opening_time
      t.time :closing_time
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :gyms, :name, unique: true
  end
end
