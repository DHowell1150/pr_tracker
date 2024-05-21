require "rails_helper" 

describe Goal, type: :model do
  describe "validations" do
    it { should validate_numericality_of :weight}
    it { should validate_numericality_of :reps}
    it { should validate_presence_of :weight}
    it { should validate_presence_of :reps}
  end

  describe "relationships" do
    it { should belong_to :athlete}
    it { should have_many :movement_goals}
    it { should have_many(:movements).through(:movement_goals)}
  end
end