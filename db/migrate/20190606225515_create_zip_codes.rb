class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.string :zip
      t.string :country
      t.integer :state
      t.string :city

      t.timestamps
    end
  end
end
