FactoryBot.define do
  factory :payment do
    quantity { 1.5 }
    status { 1 }
    client { nil }
    loan { nil }
    promoter { nil }
  end
end
