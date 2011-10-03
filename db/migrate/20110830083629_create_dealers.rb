class CreateDealers < ActiveRecord::Migration
  def self.up
    create_table :dealers do |t|
      t.string :name
      t.integer :factory_id
      t.integer :consumer_catchment

      t.timestamps
    end
  end

  def self.down
    drop_table :dealers
  end
end
