class CreateConsumerSelections < ActiveRecord::Migration
  def self.up
    create_table :consumer_selections do |t|
      t.integer :round_id
      t.integer :customer_id
      t.boolean :purchase
      t.integer :brand_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consumer_selections
  end
end
