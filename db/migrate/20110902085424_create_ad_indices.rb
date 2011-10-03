class CreateAdIndices < ActiveRecord::Migration
  def self.up
    create_table :ad_indices do |t|
      t.integer :round_id
      t.integer :brand_id
      t.integer :ad_index

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_indices
  end
end
