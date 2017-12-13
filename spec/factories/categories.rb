FactoryBot.define do
  factory :category do
    title { Faker::Hipster.sentence(2) }

  end
end