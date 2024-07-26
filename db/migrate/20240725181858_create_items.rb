class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :description
      t.references :group, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.text :specification

      t.timestamps
    end
  end
end
