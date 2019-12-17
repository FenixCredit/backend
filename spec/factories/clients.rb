FactoryBot.define do
  factory :client do
    client_type { [1,2].sample }
    street { Faker::Address.street_name }
    external_number { Faker::Address.building_number }
    internal_number { Faker::Address.building_number }
    colony { Faker::Address.street_name  }
    user
    promoter
  end
end
