class CreateAttemptResults < ActiveRecord::Migration[7.0]
  def change
    create_table :attempt_results do |t|
      t.references :attempt, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :chosenoption
      t.boolean :result
      t.integer :timetaken
      t.boolean :attempted
      t.boolean :markedforreview

      t.timestamps
    end
  end
end
