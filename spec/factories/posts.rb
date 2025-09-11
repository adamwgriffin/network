FactoryBot.define do
  factory :post do
    slug { "MyString" }
    title { "MyString" }
    body { "MyText" }
    user { nil }
  end
end
