class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string :name
      t.integer :department_id
      t.integer :value
      t.boolean :absolute

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
