FactoryBot.define do
  factory :promissory_note do
    file { "MyString" }
    code { "MyString" }
    loan { nil }
    guarantee { nil }
  end
end
