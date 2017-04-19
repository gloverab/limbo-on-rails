class AddGenericToAvatars < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :generic?, :boolean, :default => false
  end
end
