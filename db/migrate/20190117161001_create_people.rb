class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :street
      t.string :city
      t.string :zip
      t.string :country

      t.timestamps
    end
  end
end
