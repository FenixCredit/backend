FactoryBot.define do
  factory :guarantee do
    is_favourite { [true, false].sample }
    street { Faker::Address.street_name }
    external_number { Faker::Address.building_number }
    internal_number { Faker::Address.building_number }
    colony { Faker::Address.street_name  }
    identification { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    address_proof { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    warning_letter { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')) }
    user
  end
end
