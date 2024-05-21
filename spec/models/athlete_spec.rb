require "rails_helper"

describe Athlete, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :gender}
    it {should validate_presence_of :height}
    it {should validate_presence_of :weight}
    it {should validate_numericality_of :height}
    it {should validate_numericality_of :weight}
    it {should validate_presence_of :birthday}

  describe "relationships" do
    it { should belong_to :user}
    it { should have_many :movements}
    # it { should have_many(:movement_goals).through(:movements)}
    it { should have_many(:movement_goals).through(:goals)}
    it { should have_many :goals }
    it { should have_many :progresses}

    #steve's
    # it { should belong_to :user}
    # it { should have_many :movement_goals }
    # it { should have_many(:goals).through(:movement_goals) }
    # it { should have_many :progress_movements }
    # it { should have_many :progresses.though(progress_movements) }
    end
  end
end