require 'rails_helper'

RSpec.describe Realm, type: :model do
  it { should have_many(:characters) }
end
