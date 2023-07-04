class Ticker < ApplicationRecord
  enum symbol_types: [:shares]
end
