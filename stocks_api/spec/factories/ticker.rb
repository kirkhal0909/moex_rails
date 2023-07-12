FactoryBot.define do
  factory :ticker do
    symbol { SecureRandom.alphanumeric(5).upcase }
    name { 'name' }
    name_full { 'name_full' }
    name_en { 'name_en' }
    isin { 'isin' }
    list_level { 1 }
    ticker_values { build_list(:ticker_value, 10) }
  end
end
