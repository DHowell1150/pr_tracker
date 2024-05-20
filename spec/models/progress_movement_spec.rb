require "rails_helper"

describe ProgressMovement, type: :model do
  describe "validations" do

  end

  describe "relationships" do
    it { should belong_to :progress}
    it { should belong_to :movement}
  end
end