class CreateClassns < ActiveRecord::Migration[7.0]
  def change
    create_table :classns do |t|
      t.string :title

      t.timestamps
    end
  end
end
