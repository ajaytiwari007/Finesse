class CreateInvestments < ActiveRecord::Migration
  def self.up
    create_table :investments do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :investment_type_id
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :investments
  end
end
