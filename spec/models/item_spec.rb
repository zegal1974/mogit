require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe 'associations' do  
    it { should belong_to(:item_sub_class) }
    it { should belong_to(:set).class_name('ItemSet') }
    it { should belong_to(:appearance).class_name('ItemAppearance').inverse_of(:items) }
  end
end
