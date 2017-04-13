class AddHoursAndMinutesToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :hours, :integer
    add_column :decisions, :minutes, :integer
  end
end
