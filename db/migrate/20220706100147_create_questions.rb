class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :q
      t.string :opt1
      t.string :opt2
      t.string :opt3
      t.string :opt4
      t.string :solution
      t.integer :correctoption
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
