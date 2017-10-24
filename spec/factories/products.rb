FactoryGirl.define do
  factory :product do
    name { Faker::HarryPotter.character }
    brand { Faker::HarryPotter.location }
    model { Faker::RickAndMorty.location }
    sku { Faker::Bitcoin.address }
    price { Faker::Number.number(3) }
    desc { Faker::HarryPotter.quote }
  end
end
