class AddImagePathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uploaded_avatar.url, :string, default: "Bee-icon.png"
  end
end
