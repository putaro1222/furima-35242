FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    block { '神南1-1' }
    building { 'フレーム神南ビル' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user, :item
  end
end
