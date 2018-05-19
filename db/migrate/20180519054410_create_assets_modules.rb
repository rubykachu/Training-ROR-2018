# frozen_string_literal: true

class CreateAssetsModules < ActiveRecord::Migration[5.1]
  def change
    create_table :assets_modules do |t|
      t.string :type, null: false, index: true
      t.belongs_to :assets, index: true
      t.belongs_to :module, index: true, polymorphic: true
      t.timestamps
    end
  end
end
