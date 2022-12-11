class CreateRides < ActiveRecord::Migration[7.0]
  def up
    create_enum :ride_status, [:pending, :active, :finished, :canceled]

    create_table :rides do |t|
      t.references :rider,                index: true, foreign_key: true, null: false
      t.references :driver,               index: true, foreign_key: true, null: true
      t.enum :ride_status,                enum_type: :ride_status, default: :pending, null: false
      t.float :start_latitude,            null: false
      t.float :start_longitude,           null: false
      t.float :end_latitude,              null: false
      t.float :end_longitude,             null: false
      t.numeric :base_feed,               null: false
      t.numeric :total,                  null: false
    end
  end

  def down
    drop_table :rides
  end
end
