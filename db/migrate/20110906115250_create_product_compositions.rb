class CreateProductCompositions < ActiveRecord::Migration
  def self.up
    create_table :product_compositions do |t|
      t.integer :product_type_id
      t.integer :factory_input_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :product_compositions
  end
end
