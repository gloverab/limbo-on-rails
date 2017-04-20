class AddReasonToDiscussions < ActiveRecord::Migration[5.0]
  def change
    add_column :discussions, :reason, :text
  end
end
