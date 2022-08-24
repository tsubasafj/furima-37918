FactoryBot.define do
  factory :purchase_shipping_address do
    zip_code {'123-4567'}
    prefecture_id { 2 }
    city { '〇〇区' }
    address_line1 { '1-1-1' }
    address_line2 { '〇〇マンション' }
    phone_number { '09012345678' }
  end
end