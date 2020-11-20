FactoryBot.define do
  factory :item do
    image
    user
    description 
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    prefecture_id { '2' }
    handling_time_id { '2' }
    price
  end
end
