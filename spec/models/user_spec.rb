require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき'do
      it '正確な情報を入力していれば、ユーザー登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
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
      it 'emailには@がないと登録できない' do
        @user.email = "test-test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailは一意性であること' do
        @user.save
        @user2 = FactoryBot.build(:user)
        binding.pry
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
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
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = "123ab"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角だと登録でいない' do
        @user.password = "123あいう"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'name_firstが空だとユーザー登録できない' do
        @user.name_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'name_firstが漢字・平仮名・片仮名以外だとユーザー登録できない' do
        @user.name_first = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first is invalid")
      end
      it 'name_lastが空だとユーザー登録できない' do
        @user.name_last =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it 'name_lastが漢字・平仮名・片仮名以外だとユーザー登録できない' do
        @user.name_last = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last is invalid")
      end
      it 'name_first_kanaが空だとユーザー登録できない' do
        @user.name_first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana can't be blank")
      end
      it 'name_first_kanaが片仮名以外だとユーザー登録できない' do
        @user.name_first_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana is invalid")
      end
      it 'name_last_kanaが空だとユーザー登録できない' do
        @user.name_last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana can't be blank")
      end
      it 'name_lastが片仮名以外だとユーザー登録できない' do
        @user.name_last_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana is invalid")
      end
      it '誕生日が空だとユーザー登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
