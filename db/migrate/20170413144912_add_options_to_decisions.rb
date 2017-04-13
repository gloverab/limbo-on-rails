class AddOptionsToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :option_1, :string
    add_column :decisions, :option_2, :string
  end
end
