class CreateChannelIncentives < ActiveRecord::Migration
  def self.up
    create_table :channel_incentives do |t|
      t.string :name
      t.boolean :incentive_type

      t.timestamps
    end
  end

  def self.down
    drop_table :channel_incentives
  end
end
