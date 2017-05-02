class ChangePersuasionToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :votes, :persuasion, :integer
  end
end
