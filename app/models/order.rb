class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token
    
  
    belongs_to :buy
  end
end
