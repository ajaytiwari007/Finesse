class UserMigrate < ActiveRecord::Migration
  def self.up
    add_column :users,:name,:string
    add_column :users,:username,:string
    add_column :users,:facilitator_group_id,:integer
    add_column :users,:admin,:boolean
    add_column :users,:facilitator,:boolean


  end

  def self.down
    remove_column :users,:name
    remove_column :users,:username
     remove_column :users,:facilitator_group_id
      remove_column :users,:admin
    remove_column :users,:facilitator

  end
end
