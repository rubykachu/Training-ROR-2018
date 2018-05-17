# frozen_string_literal: true

class CreateTaxonomies < ActiveRecord::Migration[5.1]
  def change
    create_table :taxonomies do |t|
      t.string :name, null: false
      t.string :code, null: false, index: true, unique: true
      t.integer :position, default: 0, index: true, unique: true
      t.timestamps
    end
  end
end
