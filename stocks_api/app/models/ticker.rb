class Ticker < ApplicationRecord
  enum symbol_type: [:shares]

  has_many :ticker_values
  has_many :news_tickers
  has_many :news, through: :news_tickers
  validates_uniqueness_of :symbol, allow_blank: false
end
