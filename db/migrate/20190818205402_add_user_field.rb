class AddUserField < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ip_addreess, :json, default: []
  end
end
