class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :score, default: 0
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.timestamps
    end
  end
end
