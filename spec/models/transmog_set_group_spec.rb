require 'rails_helper'

RSpec.describe TransmogSetGroup, type: :model do
  it { should have_many(:sets).class_name('TransmogSet') }
end
