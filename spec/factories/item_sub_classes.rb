FactoryBot.define do
  factory :item_sub_class do
    name { '布甲' }
    parent { :item_class }
  end
end
