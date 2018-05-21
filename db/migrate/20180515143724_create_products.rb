# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false, index: true, unique: true
      t.string :slug, null: false, index: true, unique: true
      t.integer :price, null: false, default: 0
      t.integer :quantity, null: false
      t.datetime :available_on, null: false, index: true
      t.datetime :discontinue_on, null: true
      t.timestamps
    end
  end
end
