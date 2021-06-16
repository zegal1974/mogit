require 'rails_helper'

RSpec.describe ItemSet, type: :model do
  it { should have_many(:items).with_foreign_key(:set_id) }
end
