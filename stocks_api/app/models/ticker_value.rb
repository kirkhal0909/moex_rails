class TickerValue < ApplicationRecord
  belongs_to :ticker
  validates :ticker_id, uniqueness: { scope: :date }

  %i[open low high close].each do |column_name|
    validates column_name, exclusion: { in: [nil, 0] }
  end

  default_scope { order(date: :desc) }
end
