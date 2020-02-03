class AddCompletedAtOnOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :completed_at, :datetime, null: true
  end
end
