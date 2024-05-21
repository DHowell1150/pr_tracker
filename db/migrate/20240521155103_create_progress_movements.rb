class CreateProgressMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :progress_movements do |t|
      t.references :progress, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
