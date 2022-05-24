class Conversion < ApplicationRecord
  validates :amount, presence: true

  enum from_currency: {
    usd: 0,
    jpy: 1,
    cop: 2
  }, _prefix: :from_currency

  enum to_currency: {
    usd: 0,
    jpy: 1,
    cop: 2
  }, _prefix: :to_currency

  def display_amount
    return amount if from_currency == to_currency

    amount.to_f * exchange_rate.to_f
  end
end
