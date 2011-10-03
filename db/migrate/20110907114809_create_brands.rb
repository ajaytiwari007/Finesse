class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.integer :player_id
      t.string :name
      t.integer :product_type_id
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
