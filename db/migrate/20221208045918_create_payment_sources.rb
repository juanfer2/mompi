class CreatePaymentSources < ActiveRecord::Migration[7.0]
  def up
    create_table :payment_sources do |t|
      t.references :user,          index: true, foreign_key: true, null: false
      t.string :name,              null: false
      t.string :token_aceptation,  null: false
      t.string :token_id,          null: false
    end
  end

  def down
    drop_table :payment_sources
  end
end
