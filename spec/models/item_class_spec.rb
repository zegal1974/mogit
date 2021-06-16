require 'rails_helper'

RSpec.describe ItemClass, type: :model do
  describe 'associations' do
    it { should have_many(:sub_classes).class_name('ItemSubClass') 
      .with_foreign_key(:parent_id) }
  end
end
