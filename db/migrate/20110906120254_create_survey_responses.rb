class CreateSurveyResponses < ActiveRecord::Migration
  def self.up
    create_table :survey_responses do |t|
      t.integer :player_id
      t.integer :student_group_survey_id
      t.integer :question_option_id

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_responses
  end
end
