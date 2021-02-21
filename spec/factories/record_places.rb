FactoryBot.define do
  factory :record_place do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '東京' }
    address { 'テスト市' }
    building { 'テストビル' }
    phone_number { '09012345678' }
    user_id { 3 }
    item_id { 3 }
  end
end
