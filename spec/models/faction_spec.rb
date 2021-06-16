require 'rails_helper'

RSpec.describe Faction, type: :model do
  context 'associations' do
    it { should belong_to(:group).class_name('FactionGroup').optional }
  end

  describe 'faction_group' do
    before(:example) do
      @group = create(:faction_group)
      @faction = create(:faction, group: @group)
    end

    it { expect(@group.factions.size).to eq(1) }
    it { expect(@group.factions[0]).to eq(@faction) }
    it { expect(@faction.group).to eq(@group) }
  end
end
