class TickerValue < ApplicationRecord
  belongs_to :ticker
  validates :ticker_id, uniqueness: { scope: :date }

  default_scope { order(date: :desc) }
end
