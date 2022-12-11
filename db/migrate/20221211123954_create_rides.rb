class CreateRides < ActiveRecord::Migration[7.0]
  def up
    create_enum :ride_status, [:pending, :active, :finished, :canceled]

    create_table :rides do |t|
      t.references :rider,                  index: true, foreign_key: true, null: false
      t.references :driver,                 index: true, foreign_key: true, null: true
      t.enum :ride_status,                  enum_type: :ride_status, default: :pending, null: false
  
      t.float :start_location_latitude,     null: false
      t.float :start_location_longitude,    null: false
      t.float :end_location_latitude,       null: true
      t.float :end_location_longitude,      null: true

      t.datetime :start_at                  null: true
      t.datetime :end_at                    null: true

      t.numeric :kilometers                 null: true, precision: 12, scale: 2
      t.numeric :base_feed,                 null: false, precision: 12, scale: 2
      t.numeric :total,                     null: false, precision: 12, scale: 2

      t.timestamps
    end
  end

  def down
    drop_table :rides
  end
end
