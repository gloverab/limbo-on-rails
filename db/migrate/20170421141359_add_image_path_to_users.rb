class AddImagePathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_path, :string, default: "Bee-icon.png"
  end
end
