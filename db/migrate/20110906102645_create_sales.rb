class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :round_id
      t.integer :brand_id
      t.integer :volume

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
