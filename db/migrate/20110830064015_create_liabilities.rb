class CreateLiabilities < ActiveRecord::Migration
  def self.up
    create_table :liabilities do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :long_term_loans
      t.integer :short_term_loans
      t.integer :net_worth

      t.timestamps
    end
  end

  def self.down
    drop_table :liabilities
  end
end
