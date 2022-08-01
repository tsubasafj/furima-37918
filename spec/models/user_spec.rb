require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,
      last_name_kana,first_name_kana,birth_dateが存在すれば登録できる' do
        
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
        
      end
      it '重複したemailが存在する場合は登録できない' do

      end
      it 'emailは@を含まないと登録できない' do

      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordは半角数字だけでは登録できない' do

      end
      it 'passwordはアルファベットだけでは登録できない' do

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end
      it 'passwordが129文字以上では登録できない' do

      end
      it 'お名前(全角)は名字が空では登録できない' do
        
      end
      it 'お名前(全角)は名前が空では登録できない' do
        
      end
      it 'お名前(全角)はアルファベットでは登録できない' do
        
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        
      end
      it 'お名前カナ(全角)はアルファベットでは登録できない' do
        
      end
      it '生年月日が空では登録できない' do
        
      end
    end
  end
end
