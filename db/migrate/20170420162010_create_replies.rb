class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :discussion_id
      t.integer :author_id
    end
  end
end
