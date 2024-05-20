class DeleteWeightFromProgressMovements < ActiveRecord::Migration[7.1]
  def change
    remove_column :progress_movements, :weight
    remove_column :progress_movements, :reps
  end
end
