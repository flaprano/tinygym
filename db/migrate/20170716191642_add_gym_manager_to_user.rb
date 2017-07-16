class AddGymManagerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gym_manager, :boolean
  end
end
