FactoryBot.define do
  factory :user, class: "User" do
    first_name { "Test" }
    last_name { "User" }
    credentials { "M.D." }

    association :company
  end

  factory :house, class: "User" do
    first_name { "Gregory" }
    last_name { "House" }
    credentials { "M.D." }

    association :company
  end

  factory :cuddy, class: "User" do
    first_name { "Lisa" }
    last_name { "Cuddy" }
    credentials { "M.D." }

    association :company
  end

  factory :cameron, class: "User" do
    first_name { "Allison" }
    last_name { "Cameron" }
    credentials { "M.D." }

    association :company
  end

  factory :wilson, class: "User" do
    first_name { "James" }
    last_name { "Wilson" }
    credentials { "M.D." }

    association :company
  end

  factory :thirteen, class: "User" do
    first_name { "Remy" }
    last_name { "Hadley" }
    nickname { "Thirteen" }
    credentials { "M.D." }

    association :company
  end

  factory :taub, class: "User" do
    first_name { "Chris" }
    last_name { "Taub" }
    credentials { "M.D." }

    association :company
  end

  factory :kutner, class: "User" do
    first_name { "Lawrence" }
    last_name { "Kutner" }
    credentials { "M.D." }

    association :company
  end
end
