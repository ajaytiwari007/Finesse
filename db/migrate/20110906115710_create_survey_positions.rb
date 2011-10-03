class CreateSurveyPositions < ActiveRecord::Migration
  def self.up
    create_table :survey_positions do |t|
      t.string :position

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_positions
  end
end
