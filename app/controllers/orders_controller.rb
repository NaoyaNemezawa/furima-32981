class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id || Order.find_by(item_id: params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      redirect_to item_orders_path(@item.id)
      flash[:alert] = @order_address.errors.full_messages
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :number, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
