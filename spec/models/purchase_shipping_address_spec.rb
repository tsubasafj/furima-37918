require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'address_line2は空でも保存できる' do
        @purchase_shipping_address.address_line2 = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空では保存できない' do
        @purchase_shipping_address.zip_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Zip code can't be blank"
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_shipping_address.zip_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include 'Zip code is invalid'
      end
      it 'prefectureが「---」では保存できない' do
        @purchase_shipping_address.prefecture_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'cityが空では保存できない' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      it 'address_line1が空では保存できない' do
        @purchase_shipping_address.address_line1 = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Address line1 can't be blank"
      end
      it 'phone_numberが空では保存できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは11桁以上では保存できない' do
        @purchase_shipping_address.phone_number = '090123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは10桁以下では保存できない' do
        @purchase_shipping_address.phone_number = '090123456'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは半角数値以外では保存できない' do
        @purchase_shipping_address.phone_number = '０９０１２３４５６７８'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'userが紐づいていないと保存できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと保存できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end