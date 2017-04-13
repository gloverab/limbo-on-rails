class AddDeadlineToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :deadline, :datetime
  end
end
