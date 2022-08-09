require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it 'image,name,content,price,category,condition,shipping_fee,prefecture,shipping_timeが存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが40文字以上では出品できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it 'contentが1000文字以上では出品できない' do
        @item.content = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Content is too long (maximum is 1000 characters)'
      end
      it 'categoryが「---」では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'conditionが「---」では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end
      it 'shipping_feeが「---」では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee must be other than 1'
      end
      it 'prefectureが「---」では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'shipping_timeが「---」では出品できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping time must be other than 1'
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
