class AddAuthorToDiscussions < ActiveRecord::Migration[5.0]
  def change
    add_column :discussions, :author_id, :integer
  end
end
