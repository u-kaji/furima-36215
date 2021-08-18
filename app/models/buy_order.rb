class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :prefecture_id, :city, :address, :building, :phone_num, :token

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Don't need hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :token
  end

    def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Order.create(post_num: post_num, prefecture_id: prefecture_id, city: city, address: address, building: building,
        phone_num: phone_num, buy_id:buy.id)
    end
  
end