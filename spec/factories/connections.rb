FactoryBot.define do
  factory :connection do
    association :requester, factory: :house
    association :recipient, factory: :wilson
    status { "accepted" }
  end
end
