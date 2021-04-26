class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :training_title
      t.string :training_time
      t.text :training_text
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
