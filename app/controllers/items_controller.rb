class ItemsController < ApplicationController
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_description, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
