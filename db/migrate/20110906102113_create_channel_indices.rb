class CreateChannelIndices < ActiveRecord::Migration
  def self.up
    create_table :channel_indices do |t|
      t.integer :round_id
      t.integer :brand_id
      t.integer :channel_index

      t.timestamps
    end
  end

  def self.down
    drop_table :channel_indices
  end
end
