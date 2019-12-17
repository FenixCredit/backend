FactoryBot.define do
  factory :promoter do
    aka { Faker::Lorem.word }
    contract { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    user
    employee
  end
end
