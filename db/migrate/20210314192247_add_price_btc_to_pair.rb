class AddPriceBtcToPair < ActiveRecord::Migration[6.1]
  def change
    add_column :pairs, :price_btc, :decimal, precision: 20, scale: 10, default: "0", null: false
  end
end
