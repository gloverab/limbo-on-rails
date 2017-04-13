class AddAuthorIdToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :author_id, :integer
  end
end
