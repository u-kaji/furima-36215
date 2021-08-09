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
    validates :price, format:{with: /\A[0-9]+\z/}, inclusion:{in: 300..9_999_999}
  end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :send_cost
    belongs_to :prefecture
    belongs_to :send_day
