class CreateUos < ActiveRecord::Migration[7.1]
  def change
    create_table :uos do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :kind
      t.string :abbreviation

      t.timestamps
    end
  end
end
