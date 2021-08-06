require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だとユーザー登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だとユーザー登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だとユーザー登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationgがpasswordと一致していないと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'name_firstが空だとユーザー登録できない' do
      @user.name_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first can't be blank")
    end
    it 'name_lastが空だとユーザー登録できない' do
      @user.name_last =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last can't be blank")
    end
    it 'name_first_kanaが空だとユーザー登録できない' do
      @user.name_first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first kana can't be blank")
    end
    it 'name_last_kanaが空だとユーザー登録できない' do
      @user.name_last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last kana can't be blank")
    end
    it '誕生日が空だとユーザー登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
