class Ticker < ApplicationRecord
  enum symbol_type: [:shares]

  has_many :ticker_values
  validates_uniqueness_of :symbol, allow_blank: false
end
