require 'rails_helper'

RSpec.describe Race, type: :model do
  it { should have_many(:characters) }
end
