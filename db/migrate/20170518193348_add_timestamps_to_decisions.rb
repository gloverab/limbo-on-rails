class AddTimestampsToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column(:decisions, :created_at, :datetime)
    add_column(:decisions, :updated_at, :datetime)
  end
end
