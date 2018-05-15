class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, index: true
      t.string :code, null: false, index: true, unique: true
      t.string :email, null: true
      t.integer :total_payment, null: false
      t.timestamps
    end
  end
end
