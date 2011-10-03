class CreateInvestmentTypes < ActiveRecord::Migration
  def self.up
    create_table :investment_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :investment_types
  end
end
