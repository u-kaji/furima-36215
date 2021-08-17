require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_order = FactoryBot.build(:buy_order, item_id: item.id, user_id: user.id)
    sleep(0.5)
  end


  describe '商品の購入' do
    context '商品が購入可能' do
      it '必要な情報が入力されていれば購入可能' do
        expect(@buy_order).to be_valid
      end

      it '建物情報は入力されていなくても購入可能' do
        @buy_order.building = ""
        expect(@buy_order).to be_valid
      end
    end
    
    context '商品が購入不可能' do
      
      it '郵便番号が空だと購入不可能' do
        @buy_order.post_num = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Post num can't be blank")
      end

      it '郵便番号に-が使われていないと購入不可能' do
        @buy_order.post_num = "1234567"
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end

      it '都道府県が選択されていないと購入不可能' do
        @buy_order.prefecture_id = 1
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空だと購入不可能' do
        @buy_order.city = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入不可能' do
        @buy_order.address = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入不可能' do
        @buy_order.phone_num = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone num can't be blank")
      end

      it '電話番号に-が入っていると購入不可能' do
        @buy_order.phone_num = "012-3456-7890"
        @buy_order.invalid?
        expect(@buy_order.errors.full_messages).to include("Phone num is invalid. Don't need hyphen(-)")
      end
    end
  end
end






