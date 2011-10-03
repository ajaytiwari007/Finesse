class CreateMacroIndicators < ActiveRecord::Migration
  def self.up
    create_table :macro_indicators do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :macro_indicators
  end
end
