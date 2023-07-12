FactoryBot.define do
  factory :ticker_value do
    date { rand(1..50_000).days.ago }
    open { rand(100..1000) * rand }
    high { rand(100..1000) * rand }
    low { rand(100..1000) * rand }
    close { rand(100..1000) * rand }
    volume { rand(100..1000) * rand }
    value { rand(100..1000) * rand }
    capitalization { rand(100..1000) * rand }
  end

  trait :with_ticker do
    association :ticker
  end
end
