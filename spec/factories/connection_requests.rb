FactoryBot.define do
  factory :connection_request do
    association :sender, factory: :house
    association :receiver, factory: :wilson
  end
end
