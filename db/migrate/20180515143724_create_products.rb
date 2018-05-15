class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false, index: true, unique: true
      t.integer :quantity, null: false
      t.datetime :available_on, null: false, index: true, unique: true
      t.datetime :discontinue_on, null: true, index: true, unique: true
      t.timestamps
    end
  end
end
