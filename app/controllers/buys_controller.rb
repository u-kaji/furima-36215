class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :user_redirect, only:[:index, :create]


  def index
    @buy_order = BuyOrder.new
    end
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_order).permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id:current_user.id, item_id:@item.id, token:params[:token])
  end

  def user_redirect
    redirect_to root_path if @item.buy.present?
    end
    if current_user.id == @item.user.id
      redirect_to root_path
    end

end


