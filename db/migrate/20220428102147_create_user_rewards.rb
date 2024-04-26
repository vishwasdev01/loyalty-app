class CreateUserRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rewards do |t|
      t.references :user, foreign_key: true
      t.references :reward, foreign_key: true

      t.timestamps
    end
  end
end
