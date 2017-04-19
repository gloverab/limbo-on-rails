class ChangeColumnNameInAvatar < ActiveRecord::Migration[5.0]
  def change
    rename_column :avatars, :generic?, :generic
  end
end
