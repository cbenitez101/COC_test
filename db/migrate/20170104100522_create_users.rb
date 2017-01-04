class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :rol
      t.string :username
      t.string :email
      t.string :pass
      t.timestamps
    end
  end
end
