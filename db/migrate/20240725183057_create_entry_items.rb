class CreateEntryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :entry_items do |t|
      t.references :entry, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
