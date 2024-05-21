class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.references :athlete, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true
      t.float :target_weight
      t.integer :target_reps

      t.timestamps
    end
  end
end
