require 'rails_helper'

RSpec.describe FactionGroup, type: :model do
  context 'associations' do
    it { should have_many(:factions).with_foreign_key(:group_id) }
  end
end
