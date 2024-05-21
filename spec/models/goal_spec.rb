require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "validations" do
    it { should validate_presence_of :target_weight }
    it { should validate_presence_of :target_reps }
    it { should validate_numericality_of :target_weight }
    it { should validate_numericality_of :target_reps }
  end

  describe "relationships" do
    it { should belong_to :athlete }
    it { should belong_to :movement }
  end
end
