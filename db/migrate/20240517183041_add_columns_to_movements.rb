class AddColumnsToMovements < ActiveRecord::Migration[7.1]
  def change
    add_column :movements, :image, :string
    add_column :movements, :video, :string
  end
end
