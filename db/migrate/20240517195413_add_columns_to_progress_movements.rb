class AddColumnsToProgressMovements < ActiveRecord::Migration[7.1]
  def change
    add_column :progress_movements, :weight, :integer
    add_column :progress_movements, :reps, :integer
  end
end
