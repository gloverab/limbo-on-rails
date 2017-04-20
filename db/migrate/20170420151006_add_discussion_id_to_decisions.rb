class AddDiscussionIdToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :discussion_id, :integer
  end
end
