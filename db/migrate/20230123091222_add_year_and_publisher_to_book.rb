class AddYearAndPublisherToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :year, :integer
    add_column :books, :publisher, :string
  end
end
