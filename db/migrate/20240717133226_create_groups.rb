class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :description
      t.string :pcasp

      t.timestamps
    end
  end
end
