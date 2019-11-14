FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    gender { Faker::Number.between(0, 2) }
    profile_picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    birthday { Faker::Date.birthday(18, 65) }
    is_active { false }
    preferences { {} }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
