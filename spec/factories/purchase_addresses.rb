FactoryBot.define do
  factory :purchase_address do
    token {'tok_abcdefghijk00000000000000000'}
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011112222' }
  end
end
