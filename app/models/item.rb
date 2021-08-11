class Item < ApplicationRecord
  
  with_options presence:true do
    validates :image
    validates :name
    validates :detail
      with_options numericality:{other_than: 1, message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :send_cost_id
      validates :prefecture_id
      validates :send_day_id
      end
    validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of range"}
    validates :price, numericality:{only_integer: /\A[0-9]+\z/, message: "is invalid"}
  end

  has_one_attached :image
  belongs_to :user
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :send_cost
    belongs_to :prefecture
    belongs_to :send_day
end
