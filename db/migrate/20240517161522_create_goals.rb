class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.references :athlete, null: false, foreign_key: true
      t.string :movement_name
      t.integer :weight
      t.integer :reps

      t.timestamps
    end
  end
end
