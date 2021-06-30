FactoryBot.define do
  factory :achievement do
    name { "MyString" }
    description { "MyString" }
    reward { "MyString" }
    instance { nil }
    faction { "" }
    supercede { nil }
    category { nil }
    points { 1 }
    flags { 1 }
    icon_file { nil }
    reward_item { nil }
    mininum_criteria { 1 }
    criteria_tree { 1 }
    shares_criteria { 1 }
    covenat { nil }
  end
end
