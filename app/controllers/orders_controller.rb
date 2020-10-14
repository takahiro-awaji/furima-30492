class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  before_action :sold_out_item

  def index
    @item = Item.find(params[:item_id])
    @address = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = OrderForm.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :order_id, :item_id).merge(user_id: current_user.id)
  end

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_correct_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.order.nil?
  end
end
