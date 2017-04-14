class AddVoterIdToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :voter_id, :integer
  end
end
