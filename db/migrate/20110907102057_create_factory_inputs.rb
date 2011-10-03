class CreateFactoryInputs < ActiveRecord::Migration
  def self.up
    create_table :factory_inputs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :factory_inputs
  end
end
