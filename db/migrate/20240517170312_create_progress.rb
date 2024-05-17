class CreateProgress < ActiveRecord::Migration[7.1]
  def change
    create_table :progresses do |t|
      t.references :athlete, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
