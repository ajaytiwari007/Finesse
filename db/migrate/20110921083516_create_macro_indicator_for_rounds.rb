class CreateMacroIndicatorForRounds < ActiveRecord::Migration
  def self.up
    create_table :macro_indicator_for_rounds do |t|
      t.integer :round_id
      t.integer :macro_indicator_option_id

      t.timestamps
    end
  end

  def self.down
    drop_table :macro_indicator_for_rounds
  end
end
