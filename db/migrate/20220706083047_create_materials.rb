class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :file
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
