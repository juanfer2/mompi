class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :name,              null: false, default: ""
      t.string :email,             null: false, default: ""
      t.string :token,             null: false, default: ""
      t.string :password_hash,     null: false, default: ""
    end

    add_index :users,  :token, name: :index_on_users_token, unique: true
  end

  def down
    drop_table :users
  end
end
