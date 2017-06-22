class AddPersuasionToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :persuasion, :integer
  end
end
