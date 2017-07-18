class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :uploaded_avatar.url
    end
  end
end
