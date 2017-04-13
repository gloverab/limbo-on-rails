class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.string :title
      t.string :content
    end
  end
end
