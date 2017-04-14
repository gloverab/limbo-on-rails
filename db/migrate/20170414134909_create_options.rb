class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :content
      t.integer :choice_number
      t.integer :decision_id
    end
  end
end
