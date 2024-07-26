class CreatePas < ActiveRecord::Migration[7.1]
  def change
    create_table :pas do |t|
      t.string :code
      t.string :description
      t.string :objective
      t.date :start_date
      t.date :end_date
      t.references :uo, null: false, foreign_key: true
      t.string :horizon

      t.timestamps
    end
  end
end
