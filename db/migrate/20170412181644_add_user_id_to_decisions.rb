class AddUserIdToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :user_id, :integer
  end
end
