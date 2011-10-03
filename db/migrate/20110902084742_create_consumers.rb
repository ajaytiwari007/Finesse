class CreateConsumers < ActiveRecord::Migration
  def self.up
    create_table :consumers do |t|
      t.integer :dealer_id
      t.string :name
      t.integer :consumer_type_id
      t.integer :product_type_id
      t.integer :probability_of_purchase
      t.integer :ratio_of_ad
      t.integer :ratio_of_channel_push
      t.integer :ratio_of_price

      t.timestamps
    end
  end

  def self.down
    drop_table :consumers
  end
end
