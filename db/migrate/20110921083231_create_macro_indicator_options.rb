class CreateMacroIndicatorOptions < ActiveRecord::Migration
  def self.up
    create_table :macro_indicator_options do |t|
      t.integer :macro_indicator_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :macro_indicator_options
  end
end
