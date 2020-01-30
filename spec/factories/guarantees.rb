FactoryBot.define do
  factory :guarantee do
    is_fovourite { false }
    street { "MyString" }
    external_number { "MyString" }
    internal_number { "MyString" }
    colony { "MyString" }
    identification { "MyString" }
    address_proof { "MyString" }
    warning_letter { "MyString" }
    user { nil }
  end
end
