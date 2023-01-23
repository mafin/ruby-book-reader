class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :surname
      t.datetime :birthday
      t.string :country

      t.timestamps
    end
  end
end
