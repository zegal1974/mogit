FactoryBot.define do
  factory :faction do
    name { "HUMEN" }
    reputation_index { 10 }
    parent { nil }
    group { build(:faction_group) }
  end
end