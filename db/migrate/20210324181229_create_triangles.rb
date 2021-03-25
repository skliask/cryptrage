class CreateTriangles < ActiveRecord::Migration[6.1]
  def change
    create_table :triangles do |t|
      t.references :pair_a, null: false
      t.references :pair_b, null: false
      t.references :pair_c, null: false
      t.decimal :rate

      t.timestamps
    end
  end
end
