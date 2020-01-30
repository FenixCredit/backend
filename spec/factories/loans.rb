FactoryBot.define do
  factory :loan do
    quantity { 1.5 }
    status { 1 }
    period { "MyString" }
    client { nil }
  end
end
