class CreateDrivers < ActiveRecord::Migration[7.0]
  def up
    create_enum :driver_status, [:available, :occupied]

    create_table :drivers do |t|
      t.string :name,               null: false, default: ""
      t.string :number_plate,       null: false, default: ""
      t.string :token,              null: false, default: ""
      t.string :password_hash,      null: false, default: ""
      t.boolean :available,         null: false, default: true

      t.enum :status,               enum_type: :driver_status, default: :available, null: false

      t.timestamps
    end

    add_index :drivers,  :token, name: :index_on_drivers_token, unique: true
  end

  def down
    drop_table :drivers
  end
end
