class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :order, null: false, index: true
      t.belongs_to :product, null: false, index: true
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
