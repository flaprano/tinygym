class CreateDailyTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_tokens do |t|
      t.references :user, foreign_key: true
      t.references :gym, foreign_key: true
      t.string :token, null: false, default: ""
      t.boolean :used, null: false, default: false
      t.date :date_used

      t.timestamps
    end

    add_index :daily_tokens, :token, unique: true
  end
end
