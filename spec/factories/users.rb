FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
    gender { Faker::Number.between(0, 2) }
    birthday { Faker::Date.birthday(18, 65) }
  end
end
