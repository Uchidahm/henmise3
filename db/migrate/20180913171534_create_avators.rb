class CreateAvators < ActiveRecord::Migration[5.1]
  def change
    create_table :avators do |t|
      t.string :image
      t.string :name
      t.timestamps
    end
  end
end
