class AddColumnVoteCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :vote_count, :integer
  end
end
