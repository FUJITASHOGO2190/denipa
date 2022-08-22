FactoryBot.define do
  factory :post do
    association :user 

    content              {Faker::Lorem.sentence}
    washing_frequency    {Faker::Lorem.sentence}
    wearing_years        {Faker::Lorem.sentence}
    brand_id             { Faker::Number.between(from: 1, to: 10) }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
