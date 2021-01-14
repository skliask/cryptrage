class AddTickerToAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :ticker, :string
  end
end
