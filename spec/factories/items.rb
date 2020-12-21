FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from:2, to:11)}
    state_id {Faker::Number.between(from:2, to:7)}
    postage_charge_id {Faker::Number.between(from:2, to:3)}
    prefecture_id {Faker::Number.between(from:2, to:48)}
    shipment_date_id {Faker::Number.between(from:2, to:4)}
    price {Faker::Number.between(from:300, to:9999999)}
    association :user
  end
end
