class AddDealerIdToChannelIndex < ActiveRecord::Migration
  def self.up
    add_column :channel_indices, :dealer_id, :integer
  end

  def self.down
    remove_column :channel_indices, :dealer_id
  end
end
