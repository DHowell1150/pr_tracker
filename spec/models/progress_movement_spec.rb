require 'rails_helper'

RSpec.describe ProgressMovement, type: :model do
  describe "relationships" do
    it { should belong_to :progress}
    it { should belong_to :movement}
  end
end
