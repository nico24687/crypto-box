FactoryBot.define do
  factory :cryptocurrency do
    name { "#{Faker::Hipster.word.capitalize }coin" } 
    amount {Faker::Number.number(4)}
    symbol {Faker::Hipster.word[0..2].upcase }
    user
    category
  end
end
