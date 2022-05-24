FactoryBot.define do
  factory :conversion do
    amount { 200 }
    from_currency  { "usd" }
    to_currency { 'jpy' }
  end
end