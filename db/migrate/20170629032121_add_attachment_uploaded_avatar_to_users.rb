class AddAttachmentUploadedAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :uploaded_avatar
    end
  end

  def self.down
    remove_attachment :users, :uploaded_avatar
  end
end
