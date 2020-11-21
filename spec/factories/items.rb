FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    description {Faker::Internet.uuid}
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    prefecture_id { '2' }
    handling_time_id { '2' }
    price {'300'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
