class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :board, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :classn, foreign_key: true
      t.timestamps
    end
  end
end
