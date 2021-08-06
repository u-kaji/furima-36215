class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :name_first, format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :name_last, format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :name_first_kana, format:{with:/\A[ァ-ヶ一]+\z/}
    validates :name_last_kana, format:{with:/\A[ァ-ヶ一]+\z/}
    validates :birthday
    validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
end
