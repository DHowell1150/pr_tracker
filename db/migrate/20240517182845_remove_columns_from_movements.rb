class RemoveColumnsFromMovements < ActiveRecord::Migration[7.1]
  def change
    remove_column :movements, :recent_pr_weight, :integer
    remove_column :movements, :recent_pr_date, :date
    remove_column :movements, :recent_pr_reps, :integer
    remove_column :movements, :original_pr_weight, :integer
    remove_column :movements, :original_pr_date, :date
    remove_column :movements, :original_pr_reps, :integer
  end
end
