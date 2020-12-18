FactoryBot.define do
  factory :user do
    nickname {Faker::Name}
    email {Faker::Internet.free_email}
    password {Faker::Alphanumeric.alphanumeric(min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name {"ひらカナ漢"}
    first_name {"ひらカナ漢"}
    last_name_read {"カナ"}
    first_name_read {"カナ"}
    birthday {Faker::Date.between(from:"1900-01-01",to:"2010-12-31")}

  end
end
