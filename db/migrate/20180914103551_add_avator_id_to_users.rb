class AddAvatorIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avator_id, :integer
  end
end
