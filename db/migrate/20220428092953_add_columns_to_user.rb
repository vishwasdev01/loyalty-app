class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :country, :string
    add_column :users, :points, :integer, default: 0
    add_column :users, :date_of_birth, :string
    add_column :users, :phone_number, :integer
  end
end
