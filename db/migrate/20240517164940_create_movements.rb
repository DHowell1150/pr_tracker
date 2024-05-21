class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :movement_name
      t.text :description
      t.date :recent_pr_date
      t.integer :recent_pr_weight
      t.integer :recent_pr_reps
      t.date :original_pr_date
      t.integer :original_pr_weight
      t.integer :original_pr_reps
      t.references :athlete, null: false, foreign_key: true

      t.timestamps
    end
  end
end
