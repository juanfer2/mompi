class CreateRides < ActiveRecord::Migration[7.0]
  def up
    create_enum :ride_status, [:pending, :active, :finished, :canceled]

    create_table :rides do |t|
      t.references :rider,                    index: true, foreign_key: true, null: false
      t.references :driver,                   index: true, foreign_key: true, null: true
      t.enum :status,                         enum_type: :ride_status, default: :pending, null: false
  
      t.decimal :start_location_latitude,     null: false, precision: 17, scale: 14
      t.decimal :start_location_longitude,    null: false, precision: 17, scale: 14
      t.decimal :end_location_latitude,       null: true, precision: 17, scale: 14
      t.decimal :end_location_longitude,      null: true, precision: 17, scale: 14

      t.datetime :start_at,                   null: true
      t.datetime :end_at,                     null: true

      t.numeric :kilometers,                  null: true, precision: 12, scale: 2

      t.string :currency,                     null: true
      t.numeric :total_price_kilometer,       null: true, precision: 12, scale: 2
      t.numeric :total_price_time,            null: true, precision: 12, scale: 2
      t.numeric :base_fee,                    null: true, precision: 12, scale: 2
      t.numeric :total,                       null: true, precision: 12, scale: 2

      t.timestamps
    end
  end

  def down
    drop_table :rides
  end
end
