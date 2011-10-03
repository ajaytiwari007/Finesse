class AddRoundIdToAddEffect < ActiveRecord::Migration
  def self.up
    add_column :add_effects, :round_id, :integer
  end

  def self.down
    remove_column :add_effects, :round_id
  end
end
