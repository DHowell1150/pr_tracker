class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.integer :feet
      t.integer :inches
      t.integer :weight
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
