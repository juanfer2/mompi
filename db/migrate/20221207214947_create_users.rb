class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :riders do |t|
      t.string :name,              null: false, default: ""
      t.string :email,             null: false, default: ""
      t.string :token,             null: false, default: ""
      t.string :password_hash,     null: false, default: ""
    end

    add_index :riders,  :token, name: :index_on_riders_token, unique: true
  end

  def down
    drop_table :riders
  end
end
