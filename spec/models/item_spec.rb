require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品が可能' do
      it '必要情報が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品が不可能' do
      it 'nameが空だと不可' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空だと不可' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'category_idが1だと不可' do
        @item.category_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1だと不可' do
        @item.condition_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'send_cost_idが1だと不可' do
        @item.send_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send cost can't be blank")
      end
      it 'prefecture_idが1だと不可' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'send_day_idが1だと不可' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it 'priceが300円未満だと不可' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが9999999円越えると不可' do
        @item.price = 20000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが空だと不可' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '画像がなければ不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
