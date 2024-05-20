require "rails_helper"

describe Movement, type: :model do
  describe "validations" do
    it { should validate_presence_of :movement_name }
    it { should validate_presence_of :image }
    it {should validate_presence_of :video }
    it {should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :athlete }
    it { should have_many :movement_goals}
    it { should have_many :progress_movements}
  end
end