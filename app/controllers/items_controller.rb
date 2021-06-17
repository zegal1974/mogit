class ItemsController < ApplicationController
  def index
    @count = Item.count
  end

end
