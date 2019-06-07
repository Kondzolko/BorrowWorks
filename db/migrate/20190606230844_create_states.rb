class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :abbreviations
      t.string :state
    end
  end
end