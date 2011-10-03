class CreateFactories < ActiveRecord::Migration
  def self.up
    create_table :factories do |t|
      t.string :name
      t.integer :employee_count
      t.integer :capacity
      t.integer :distance_to_market
      t.integer :product_type_id
      t.integer :dealer_catchment
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :factories
  end
end
