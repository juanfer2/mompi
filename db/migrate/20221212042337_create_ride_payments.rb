class CreateRidePayments < ActiveRecord::Migration[7.0]
  def up
    create_table :ride_payments do |t|
      t.references :ride,                    index: true, foreign_key: true, null: false
      t.enum :status,                        enum_type: :payment_status, null: false
      t.string :resource_id,                 null: false

      t.timestamps
    end
  end

  def down
    drop_table :rides
  end
end
