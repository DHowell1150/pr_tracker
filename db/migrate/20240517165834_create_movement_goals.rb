class CreateMovementGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :movement_goals do |t|
      t.references :movement, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
