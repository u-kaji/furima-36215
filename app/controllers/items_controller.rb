class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    if user_signed_in?
      render new_item_path
    else
      render new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end



private

def item_params
  params.require(:item).permit(:name, :detail, :category_id, :condition_id, :send_cost_id, :prefecture_id, :send_day_id, :price, :user_id, :image).merge(user_id: current_user.id)
end
