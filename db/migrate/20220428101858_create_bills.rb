class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :amount
      t.boolean :foreign_country, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
