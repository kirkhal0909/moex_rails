class AddIssueSizeToTickers < ActiveRecord::Migration[7.0]
  def change
    add_column :tickers, :issue_size, :float, default: 0
  end
end
