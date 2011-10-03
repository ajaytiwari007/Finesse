class CreateHrIncentives < ActiveRecord::Migration
  def self.up
    create_table :hr_incentives do |t|
      t.string :name
      t.boolean :type
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_incentives
  end
end
