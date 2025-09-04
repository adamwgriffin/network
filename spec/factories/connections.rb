FactoryBot.define do
  factory :connection do
    association :user, factory: :house
    association :connected_user, factory: :wilson
  end
end
