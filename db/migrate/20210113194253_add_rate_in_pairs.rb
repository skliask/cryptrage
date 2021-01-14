class AddRateInPairs < ActiveRecord::Migration[6.1]
  def change
    add_column :pairs, :rate, :decimal, precision: 10, scale: 2, default: "0", null: false
  end
end
