FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    user
  end
end
