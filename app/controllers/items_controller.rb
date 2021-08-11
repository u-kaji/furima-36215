class ItemsController < ApplicationController
  def index
    @items = Item.all.order(id: "desc")
    
  end

  def new
    @item = Item.new
    authenticate_user!
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end



end



private

def item_params
  params.require(:item).permit(:name, :detail, :category_id, :condition_id, :send_cost_id, :prefecture_id, :send_day_id, :price, :user_id, :image).merge(user_id: current_user.id)
end
