class CreateTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :tickers do |t|
      t.string :symbol, null: false, index: { unique: true }
      t.string :name
      t.string :name_full
      t.string :name_en
      t.string :isin
      t.integer :list_level
      t.string :sec_type
      t.integer :symbol_type, default: 0

      t.timestamps
    end
  end
end
