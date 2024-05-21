require 'rails_helper'

RSpec.describe Movement, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :video }
  end

  describe "relationships" do
    it { should have_many :progress_movements }
    it { should have_many(:progresses).through(:progress_movements) }
  end
end
