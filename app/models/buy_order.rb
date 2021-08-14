class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buy_id, :post_num, :prefecture, :city, :address, :building, :phone_num

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Don't need hyphen(-)"}
    validates :user_id
    validates :item_id
  end

    def save
      buy = buy.create(user_id: user_id, item_id: item_id)
      order.create(post_num: post_num, prefecture: prefecture, city: city, address: address, building: building,
        phone_num: phone_num, buy_id:buy_id)
    end
  
end