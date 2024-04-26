class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tier_type, :string, default: "standard"
  end
end
