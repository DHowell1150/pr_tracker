require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :gender}
    it {should validate_presence_of :inches}
    it {should validate_presence_of :feet}
    it {should validate_presence_of :weight}
    it {should validate_presence_of :birthday}
    it {should validate_numericality_of :feet}
    it {should validate_numericality_of :inches}
    it {should validate_numericality_of :weight}
  end

  describe "relationships" do
    it { should belong_to :user}
    it { should have_many :goals }
    it { should have_many :movements}
  end
end
