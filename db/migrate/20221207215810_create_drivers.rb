class CreateDrivers < ActiveRecord::Migration[7.0]
  def up
    create_table :drivers do |t|
      t.string :name,              null: false, default: ""
      t.string :number_plate,      null: false, default: ""
      t.string :token,             null: false, default: ""
      t.string :password_hash,     null: false, default: ""
    end
  end

  def down
    drop_table :drivers
  end
end
