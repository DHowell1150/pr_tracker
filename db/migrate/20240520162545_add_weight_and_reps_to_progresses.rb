class AddWeightAndRepsToProgresses < ActiveRecord::Migration[7.1]
  def change
    add_column :progresses, :weight, :integer
    add_column :progresses, :reps, :integer
  end
end
