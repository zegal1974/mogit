require 'rails_helper'

RSpec.describe Reputation, type: :model do
  describe "update earned" do
    it "" do
      @rep = create(:reputation, earned: 1000)
      expect(@rep.level).to eq('neutral')
      expect(@rep.value).to eq(1000)
    end

    it "" do
      @rep = create(:reputation, earned: 5000)
      expect(@rep.level).to eq('friendly')
      expect(@rep.value).to eq(2000)
    end

    it "" do
      @rep = create(:reputation, earned: 15000)
      expect(@rep.level).to eq('honored')
      expect(@rep.value).to eq(6000)
    end
  end

  describe "build_by_faction" do
    it "" do
      faction = create(:faction)
      @rep = Reputation.build_by_faction faction
      expect(@rep).to be_instance_of(Reputation)
      expect(@rep.name).to eq("HUMEN")
    end
  end
end
