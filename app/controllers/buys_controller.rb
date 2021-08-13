class BuysController < ApplicationController
  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def buy_params
    params.require(:order).permit(:price)
  end

end

