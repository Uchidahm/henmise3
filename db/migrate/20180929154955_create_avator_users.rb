class CreateAvatorUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :avator_users do |t|
      t.references :user, foreign_key: true
      t.references :avator, foreign_key: true

      t.timestamps
    end
  end
end
 
