class AddModelInProject < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.timestamps
    end

    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :ip_addreess
      t.timestamps
    end

    create_table :evaluations do |t|
      t.references :post, foreign_key: true
      t.float :value
    end
  end
end
