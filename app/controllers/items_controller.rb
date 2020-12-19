class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    binding.pry
    items = Item.new(item_params)
    items.save
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:state_id,:postage_charge_id,:prefecture_id,:shipment_date_id,:price).merge(user_id: current_user.id)
  end
end
