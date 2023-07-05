class CreateTickerValues < ActiveRecord::Migration[7.0]
  def change
    create_table :ticker_values do |t|
      t.references :ticker, null: false, foreign_key: true
      t.date :date, null: false
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.float :volume
      t.float :value
      t.float :capitalization

      t.timestamps
    end

    add_index :ticker_values, %i[ticker_id date], unique: true
  end
end
