FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '空想市' }
    number { '5丁目55番地5' }
    building { '幻ビル' }
    tel { Faker::Number.number(digits: 11) }
    user_id {2}
    item_id {3}
  end
end
