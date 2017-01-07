class RenamePassToHashedPassword < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :pass, :hashed_password
  end
end
