FactoryGirl.define do
  factory :movie do
    association :director
    title { Faker::Name.name }
    summary { Faker::StarWars.quote }
  end
end
