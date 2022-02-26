class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.string    :postal_code_id,        null: false
      t.integer   :item_prefecture_id,    null: false
      t.string    :city,                  null: false
      t.string    :addresses,             null: false
      t.string    :building
      t.string    :phone_number,          null: false
      t.references :purchase_record,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
