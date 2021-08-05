class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :name_first_kana, presence: true
  validates :name_last_kana, presence: true
  validates :birthday, presence: true
end
