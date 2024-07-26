class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :phone
      t.string :address
      t.string :document

      t.timestamps
    end
  end
end
