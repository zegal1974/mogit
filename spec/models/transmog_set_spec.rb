require 'rails_helper'

RSpec.describe TransmogSet, type: :model do
  it { should belong_to(:group).class_name('TransmogSetGroup') }
  # it { should belong_to(:tracking_quest) }
  it { should belong_to(:name_description).class_name('ItemNameDescription') }
  it { should belong_to(:parent).class_name('TransmogSet') }

  it { should have_many(:transmog_set_members) }
  it { should have_many(:appearances).class_name('ItemAppearance')
    .source(:item_appearance).through(:transmog_set_members) }
end
