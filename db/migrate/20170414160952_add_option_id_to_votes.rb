class AddOptionIdToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :option_id, :integer
  end
end
