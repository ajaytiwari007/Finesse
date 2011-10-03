class CreateFactoryInputPrices < ActiveRecord::Migration
  def self.up
    create_table :factory_input_prices do |t|
      t.integer :round_id
      t.integer :factory_input_id
      t.integer :price
      t.timestamps
    end
  end

  def self.down
    drop_table :factory_input_prices
  end
end
