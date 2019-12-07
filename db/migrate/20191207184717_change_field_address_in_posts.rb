class ChangeFieldAddressInPosts < ActiveRecord::Migration[5.2]

  def change
    rename_column :posts, :ip_addreess, :ip_address
  end

end
