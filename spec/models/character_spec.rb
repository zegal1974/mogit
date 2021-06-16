require 'rails_helper'

RSpec.describe Character, type: :model do
  context 'associations' do
    it { should belong_to(:realm).optional(true) }
    it { should belong_to(:race).optional(true) }
    it { should belong_to(:chr_class).optional(true) }
  end
end
