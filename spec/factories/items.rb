FactoryBot.define do
  factory :item do
    product { "商品名"}
    description {Faker::Lorem.sentence}
    price { 300 }
    category_id { 2 }
    condition_id { 2 }
    ship_date_id { 2 }
    ship_base_id { 2 }
    prefecture_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
