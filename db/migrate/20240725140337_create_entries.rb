class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.date :date_entry
      t.string :number
      t.references :pa, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.decimal :total
      t.string :modality

      t.timestamps
    end
  end
end
