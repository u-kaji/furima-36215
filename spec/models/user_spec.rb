require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だとユーザー登録できない' do
      user = User.new(nickname:"", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationgがpasswordと一致していないと登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"654321",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'name_firstが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Name first can't be blank")
    end
    it 'name_lastが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Name last can't be blank")
    end
    it 'name_first_kanaが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"", name_last_kana:"たなか", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Name first kana can't be blank")
    end
    it 'name_last_kanaが空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"", birthday:"1990-01-09")
      user.valid?
      expect(user.errors.full_messages).to include("Name last kana can't be blank")
    end
    it '誕生日が空だとユーザー登録できない' do
      user = User.new(nickname:"tanaka", email:"test@test", password:"123456", password_confirmation:"123456",name_first:"太郎", name_last:"田中", name_first_kana:"たろう", name_last_kana:"たなか", birthday:"")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
