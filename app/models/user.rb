class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
      with_options format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
        validates :name_first 
        validates :name_last
      end
      with_options format:{with:/\A[ァ-ヶ一]+\z/} do
        validates :name_first_kana
        validates :name_last_kana
      end
    validates :birthday
    validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
  has_many :items
end
