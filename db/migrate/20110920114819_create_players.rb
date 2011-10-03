class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.integer :student_group_user_id
      t.integer :case_study_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
