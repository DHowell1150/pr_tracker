require "rails_helper"

describe MovementGoal, type: :model do
  describe "validations" do
  end

  describe "relationships" do
    it { should belong_to :movement}
    it { should belong_to :goal}
  end
end