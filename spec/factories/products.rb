FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    price { Faker::Number.between(1, 20) }
    description { Faker::Lorem.paragraphs }
    is_available { Faker::Boolean.boolean }
  end
end
