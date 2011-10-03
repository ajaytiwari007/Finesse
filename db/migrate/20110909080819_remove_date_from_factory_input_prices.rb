class RemoveDateFromFactoryInputPrices < ActiveRecord::Migration
  def self.up
    remove_column :factory_input_prices, :date
  end

  def self.down
    add_column :factory_input_prices, :date, :date
  end
end
