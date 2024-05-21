class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :video
      t.references :athlete, null: false, foreign_key: true

      t.timestamps
    end
  end
end
