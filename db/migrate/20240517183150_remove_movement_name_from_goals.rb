class RemoveMovementNameFromGoals < ActiveRecord::Migration[7.1]
  def change
    remove_column :goals, :movement_name, :string
  end
end
