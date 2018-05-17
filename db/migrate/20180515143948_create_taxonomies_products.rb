# frozen_string_literal: true

class CreateTaxonomiesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :taxonomies_products do |t|
      t.belongs_to :taxonomy, null: false
      t.belongs_to :product, null: false, index: true
      t.timestamps
    end
    add_index :taxonomies_products, %i[taxonomy_id product_id], unique: true
  end
end
