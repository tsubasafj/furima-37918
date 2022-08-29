class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number,
                 :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    VALID_ZIPCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    validates :zip_code, format: { with: VALID_ZIPCODE_REGEX }

    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line1

    VALID_PHONENUMBER_REGEX = /\A[0-9]{10,11}\z/
    validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX }

    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1,
                           address_line2: address_line2, phone_number: phone_number, purchase_id: purchase.id)
  end
end
