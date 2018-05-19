# frozen_string_literal: true

class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.string :original, null: false
      t.string :filename, null: false, index: true, uniq: true
      t.string :type, null: false, index: true
      t.timestamps
    end
  end
end
