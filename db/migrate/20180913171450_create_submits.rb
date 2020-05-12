class CreateSubmits < ActiveRecord::Migration[5.1]
  def change
    create_table :submits do |t|
      t.string :name
      t.string :address
      t.string :kind
      t.string :tag
      t.string :impression
      t.integer :money
      t.timestamps
    end
  end
end
