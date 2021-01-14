class FixValue < ActiveRecord::Migration[6.1]
  def change
    remove_column :pairs, :rate, :decimal, precision: 10, scale: 2, default: "0", null: false
    add_column :pairs, :rate, :decimal, precision: 20, scale: 10, default: "0", null: false
  end
end
