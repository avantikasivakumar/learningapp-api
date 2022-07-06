class CreateMaterialstats < ActiveRecord::Migration[7.0]
  def change
    create_table :materialstats do |t|
      t.references :material, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :vote
      t.string :notes
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
