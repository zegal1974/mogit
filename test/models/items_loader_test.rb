require "test_helper"

class ItemLoaderTest < ActiveSupport::TestCase

  setup do

  end

  test "load_items" do
    Item.load_items("test/models/db/")
    assert_equal 17, Item.count
    @item = Item.where(did: 17).first
    # p @item
    assert_not_nil @item
    assert_equal 4, @item.item_class
    assert_equal 4, @item.item_sub_class
  end
end
