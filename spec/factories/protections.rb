FactoryBot.define do
  factory :protection do
    title { Faker::Book.title }
    age { Faker::Number.number(digits: 2) }
    gender_id { Faker::Number.between(from: 1, to: 3) }
    cat_species_id { Faker::Number.between(from: 1, to: 16) }
    character {Faker::Lorem.sentence}

    association :user

    after(:build) do |protection|
      protection.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end