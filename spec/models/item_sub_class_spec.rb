require 'rails_helper'

RSpec.describe ItemSubClass, type: :model do
  describe 'associations' do
    it { should belong_to(:parent).class_name(:item_class) }
  end
end
