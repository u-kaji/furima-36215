class BuysController < ApplicationController

  def index
    @buy = Buy.new
    user_redirect
  end

  def new
    @buy_order = BuyOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new(buy_params)
    if @buy_order.valid?
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  
  def buy_params
    params.require(:buy_order).permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id:current_user.id, item_id:@item.id)
  end

  def user_redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.buy.present?
    end
  end

