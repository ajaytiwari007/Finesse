class CreateQuestionOptions < ActiveRecord::Migration
  def self.up
    create_table :question_options do |t|
      t.integer :question_id
      t.text :option

      t.timestamps
    end
  end

  def self.down
    drop_table :question_options
  end
end
