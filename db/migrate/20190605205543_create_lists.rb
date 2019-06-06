class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.string :comments
      t.integer :uploaded_by
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
