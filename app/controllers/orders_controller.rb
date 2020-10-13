class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @address = Address.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    binding.pry
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id)
  end
end
