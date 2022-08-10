FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    category { Category.where.not(id: 1).sample }
    condition { Condition.where.not(id: 1).sample }
    shipping_fee { ShippingFee.where.not(id: 1).sample }
    prefecture { Prefecture.where.not(id: 1).sample }
    shipping_time { ShippingTime.where.not(id: 1).sample }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
