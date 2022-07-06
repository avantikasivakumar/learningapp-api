class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.references :topic, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
