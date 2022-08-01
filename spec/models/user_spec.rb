require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "testtest.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordはアルファベットだけでは登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "a12345"
        @user.password_confirmation = "a123456"
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it 'お名前(全角)は名字が空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は名前が空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'お名前(全角)は名字が半角では登録できない' do
        @user.last_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'お名前(全角)は名前が半角では登録できない' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'お名前カナ(全角)は名字が半角では登録できない' do
        @user.last_name_kana = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'お名前カナ(全角)は名前が半角では登録できない' do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
