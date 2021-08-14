class BuysController < ApplicationController
  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new
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
    params.permit(:post_num, :prefecture, :city, :address, :building, :phone_num).merge(user_id: current_user.id)
  end

end

