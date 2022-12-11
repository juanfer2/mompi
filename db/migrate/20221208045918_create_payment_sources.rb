class CreatePaymentSources < ActiveRecord::Migration[7.0]
  def up
    create_enum :payment_sources_kind, [:card, :nequi]

    create_table :payment_sources do |t|
      t.references :rider,                index: true, foreign_key: true, null: false
      t.string :name,                     null: false
      t.string :token_aceptation,         null: false
      t.string :token_id,                 null: false
      t.string :resource_id,              null: false
      t.enum :kind,                       enum_type: :payment_sources_kind, null: false

      t.timestamps
    end
  end

  def down
    drop_table :payment_sources
  end
end
