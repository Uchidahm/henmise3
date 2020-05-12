class AddColumnsToSubmits < ActiveRecord::Migration[5.1]
  def change
    add_column :submits, :latitude, :float
    add_column :submits, :longitude, :float
  end
end
 
