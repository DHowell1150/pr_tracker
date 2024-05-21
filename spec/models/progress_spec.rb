require 'rails_helper'

RSpec.describe Progress, type: :model do
  describe "validations" do
    it { should validate_presence_of :weight}
    it { should validate_presence_of :reps}
    it { should validate_numericality_of :weight}
    it { should validate_numericality_of :reps}
  end

  describe "relationships" do
    it { should belong_to :athlete }
    it { should have_many :progress_movements }
    it { should have_many(:movements).through(:progress_movements)}
  end
end
