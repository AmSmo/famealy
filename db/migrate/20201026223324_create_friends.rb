class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :user_users do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :friend

      t.timestamps
    end
  end
end
