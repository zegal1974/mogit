require 'rails_helper'

RSpec.describe ItemAppearance, type: :model do
  # has_many :items, foreign_key: :appearance_id

  it { should have_many(:items) }
  it { should have_many(:transmog_set_members) }
  it { should have_many(:transmog_sets).through(:transmog_set_members) }
end
