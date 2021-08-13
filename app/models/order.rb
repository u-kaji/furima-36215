class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token
    
  with_options presence: true do
    validates :post_num
    validates :prefecture
    validates :city
    validates :address
    validates :phone_num
    belongs_to :buy
  end
end
