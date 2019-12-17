FactoryBot.define do
  factory :equipment do
    code { Faker::Number.number(10) }
    name { Faker::Lorem.sentence }
    cost { Faker::Number.number(3) }
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    type { [1, 2].sample }
    admin
  end
end
