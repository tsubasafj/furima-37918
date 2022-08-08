class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }, numericality: { in: 300..9_999_999 }
end
