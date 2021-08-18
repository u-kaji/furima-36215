class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :user_redirect, only:[:index]


  def index
    @buy_order = BuyOrder.new
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def new
    @buy_order = BuyOrder.new
  end

  def create
    @buy_order = BuyOrder.new(buy_params)
    if @buy_order.valid?
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_order).permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id:current_user.id, item_id:@item.id)
  end

  def user_redirect
    redirect_to root_path if @item.buy.present?
    end
  end


