class AddAdminAndUserTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :employer, :boolean
  end
end
