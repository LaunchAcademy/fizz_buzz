class AddRankToReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :rank, :integer, default: 0
  end

  def down
    remove_column :reviews, :rank
  end
end
