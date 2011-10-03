class CreatePriceIndices < ActiveRecord::Migration
  def self.up
    create_table :price_indices do |t|
      t.integer :round_id
      t.integer :brand_id
      t.integer :price_index

      t.timestamps
    end
  end

  def self.down
    drop_table :price_indices
  end
end
