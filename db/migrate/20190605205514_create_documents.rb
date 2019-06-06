class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :name
      t.integer :list_id
      t.integer :row_count
      t.string :file_path
      t.string :mapped_field, default: "{}"
      t.string :status, default: 'List not uploaded to DB'
      t.text :file_example

      t.timestamps
    end
  end
end
