class AddWeightToProductComposition < ActiveRecord::Migration
  def self.up
    add_column :product_compositions, :weight, :integer
  end

  def self.down
    remove_column :product_compositions, :weight
  end
end
