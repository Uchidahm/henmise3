class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :submit_id
      t.string :name
      t.timestamps 
    end
  end
end
