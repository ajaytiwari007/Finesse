class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|
      t.integer :survey_id
      t.integer :question_id

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_questions
  end
end
